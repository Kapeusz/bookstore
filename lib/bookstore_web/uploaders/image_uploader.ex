defmodule BookstoreWeb.Uploaders.ImageUploader do
  use Waffle.Definition
  use Waffle.Ecto.Definition

  @versions [:original, :thumbnail]
  @acl :public_read

  @extension_whitelist ~w(.jpg .jpeg .gif .png)

  def transform(:thumbnail, _file_post) do
    {:convert, "-resize 50%"}
  end

  def storage_dir(version, {_file, post}) do
    title =
      post.title
      |> String.downcase()
      |> String.replace(" ", "-")

    "images/book/#{title}/#{version}"
  end

  def validate({file, _post}) do
    file_extension = file.file_name |> Path.extname() |> String.downcase()
    Enum.member?(@extension_whitelist, file_extension)
  end

  def s3_object_headers(_version, {file, _post}) do
    [content_type: MIME.from_path(file.file_name)]
  end

  def default_url(:original, _post) do
    "https://via.placeholder.com/350x200"
  end

  def default_url(:thumbnail, _post) do
    "https://via.placeholder.com/175x100"
  end
end
