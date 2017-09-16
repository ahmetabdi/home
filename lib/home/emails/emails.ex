defmodule Platform.Emails do
  @moduledoc """
  The boundary of the email system.
  """

  import Bamboo.Email
  use Bamboo.Phoenix, view: HomeWeb.EmailView
  alias Home.Emails.Mailer

  @from "noreply@ahmet.pro"

  def deliver_later(email), do: Mailer.deliver_later(email)

  def build_contact_form(name, email, message, phone) do
    new_email()
    |> to("ahmetabdi@gmail.com")
    |> from(@from)
    |> subject("Contact Form message from #{name}")
    |> assign(:name, name)
    |> assign(:message, message)
    |> assign(:email, email)
    |> assign(:phone, phone)
    |> render("contact_form.html")
  end
end
