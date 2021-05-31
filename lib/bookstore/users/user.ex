defmodule Bookstore.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  use Pow.Extension.Ecto.Schema,
    extensions: [PowEmailConfirmation, PowPersistentSession, PowResetPassword]

  schema "users" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:address1, :string, default: nil)
    field(:address2, :string, default: nil)
    field(:address3, :string, default: nil)
    field(:city, :string)
    field(:region, :string)
    field(:zip_code, :string)
    field(:role, :string, default: "customer")
    pow_user_fields()
    timestamps()
  end

  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> pow_changeset(attrs)
    |> pow_extension_changeset(attrs)
    |> validate_password()
    |> validate_password_no_context()
    # has a number)
    |> Ecto.Changeset.validate_format(:password, ~r/[0-9]+/,
      message: "Password must contain a number"
    )
    # has an upper case letter
    |> Ecto.Changeset.validate_format(:password, ~r/[A-Z]+/,
      message: "Password must contain an upper-case letter"
    )
    # has a lower case letter
    |> Ecto.Changeset.validate_format(:password, ~r/[a-z]+/,
      message: "Password must contain a lower-case letter"
    )
    # Has a symbol
    |> Ecto.Changeset.validate_format(:password, ~r/[#\!\?&@\$%^&*\(\).,]+/,
      message: "Password must contain a symbol"
    )
    |> Ecto.Changeset.cast(attrs, [
      :first_name,
      :last_name,
      :address1,
      :address2,
      :address3,
      :city,
      :region,
      :zip_code
    ])
    |> Ecto.Changeset.validate_required([
      :first_name,
      :last_name,
      :address1,
      :city,
      :region,
      :zip_code
    ])
  end

  @app_name "Bookstore"

  defp validate_password_no_context(changeset) do
    Ecto.Changeset.validate_change(changeset, :password, fn :password, password ->
      [
        @app_name,
        String.downcase(@app_name),
        Ecto.Changeset.get_field(changeset, :email),
        Ecto.Changeset.get_field(changeset, :first_name)
      ]
      |> Enum.reject(&is_nil/1)
      |> similar_to_context?(password)
      |> case do
        true -> [password: "is too similar to username, email or #{@app_name}"]
        false -> []
      end
    end)
  end

  def similar_to_context?(contexts, password) do
    Enum.any?(contexts, &(String.jaro_distance(&1, password) > 0.85))
  end

  defp validate_password(changeset) do
    changeset
    |> validate_no_repetitive_characters()
    |> validate_no_sequential_characters()
  end

  defp validate_no_repetitive_characters(changeset) do
    Ecto.Changeset.validate_change(changeset, :password, fn :password, password ->
      case repetitive_characters?(password) do
        true -> [password: "has repetitive characters"]
        false -> []
      end
    end)
  end

  defp repetitive_characters?(password) when is_binary(password) do
    password
    |> String.to_charlist()
    |> repetitive_characters?()
  end

  defp repetitive_characters?([c, c, c | _rest]), do: true
  defp repetitive_characters?([_c | rest]), do: repetitive_characters?(rest)
  defp repetitive_characters?([]), do: false

  defp validate_no_sequential_characters(changeset) do
    Ecto.Changeset.validate_change(changeset, :password, fn :password, password ->
      case sequential_characters?(password) do
        true -> [password: "has sequential characters"]
        false -> []
      end
    end)
  end

  @sequences ["01234567890", "abcdefghijklmnopqrstuvwxyz"]
  @max_sequential_chars 3

  defp sequential_characters?(password) do
    Enum.any?(@sequences, &sequential_characters?(password, &1))
  end

  defp sequential_characters?(password, sequence) do
    max = String.length(sequence) - 1 - @max_sequential_chars

    Enum.any?(0..max, fn x ->
      pattern = String.slice(sequence, x, @max_sequential_chars + 1)

      String.contains?(password, pattern)
    end)
  end
end
