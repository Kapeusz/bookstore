defmodule BookstoreWeb.PowResetPassword.MailerView do
  use BookstoreWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
