defmodule BookstoreWeb.Pow.Messages do
  use Pow.Phoenix.Messages
  # since we're using the reset password and email confirmation
  # extensions we need to include them as well
  use Pow.Extension.Phoenix.Messages,
   extensions: [PowResetPassword, PowEmailConfirmation]

  import BookstoreWeb.Gettext

  def user_not_authenticated(_conn), do: gettext("You need to sign in to see this page.")

  def email_has_been_sent(_conn), do: "An email with reset instructions has been sent to you. Please check your inbox."
  def invalid_token(_conn), do: "The reset token has expired."
  def password_has_been_reset(_conn), do: "The password has been updated."
  # PowMessages - functions defined:
  # https://hexdocs.pm/pow/Pow.Phoenix.Messages.html#summary
  # https://github.com/danschultzer/pow/blob/master/lib/pow/phoenix/messages.ex
  def signed_in(_conn), do: gettext("Welcome back.")
  def signed_out(_conn), do: gettext("Signed out successfullly.")
  def user_not_authenticated(_conn), do: gettext("You need to sign in to see this page.")

  # PowResetPassword - functions defined:
  # https://github.com/danschultzer/pow/blob/master/lib/extensions/reset_password/phoenix/messages.ex
  def invalid_token(_conn), do: "The reset token has expired."
  def password_has_been_reset(_conn), do: "The password has been updated."
  def email_has_been_sent(_conn), do: "An email with reset instructions has been sent to you."

  # PowEmailConfirmation - functions defined:
  # https://github.com/danschultzer/pow/blob/master/lib/extensions/email_confirmation/phoenix/messages.ex
  def email_has_been_confirmed(_conn), do: "The email address has been confirmed."
  def email_confirmation_failed(_conn), do: "The email address couldn't be confirmed."
  def email_confirmation_required(_conn), do: "You need to confirm your e-mail with the link e-mailed to you."
end
