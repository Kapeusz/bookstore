defmodule Bookstore.Emails do
  import Bamboo.Email

  def contact_email(%{"email" => email, "message" => message}) do
    new_email()
    |> to("kontoy91@gmail.com")
    |> from("contact@bookstore.com")
    |> subject("Contact email")
    |> html_body("<p>Email: #{email} </ br> Message: #{message}</p></ br>")
    |> text_body("Email: #{email} Message: #{message}")
  end
end
