defmodule Home.Emails do
  import Bamboo.Email

  alias Home.Mailer

  def contact_email(name, email, message, phone)do
    new_email()
    |> to("ahmetabdi@gmail.com")
    |> from("admin@ahmet.pro")
    |> subject("ahmet.pro contact form submission")
    |> html_body("<strong>Name: #{name} -- Message: #{message} -- Phone: #{phone}</strong>")
    |> text_body("Name: #{name} -- Message: #{message} -- Phone: #{phone}")
    |> Mailer.deliver_now
  end
end
