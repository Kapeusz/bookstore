defmodule BookstoreWeb.PowEmailConfirmation.MailerView do
  use BookstoreWeb, :mailer_view

  def subject(:email_confirmation, _assigns), do: "Confirm your email address"
end
