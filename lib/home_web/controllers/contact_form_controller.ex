defmodule HomeWeb.ContactFormController do
  use HomeWeb, :controller
  alias Platform.Emails

  def new(conn, %{"email" => email,
                  "message" => message,
                  "name" => name,
                  "phone" => phone} = params) do

    Emails.build_contact_form(name, email, message, phone)
    |> Emails.deliver_later()

    text conn, "OK"
  end
end
