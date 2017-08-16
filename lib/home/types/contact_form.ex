defmodule Platform.Types.ContactForm do
  defstruct [:name, :email_address, :phone_number, :message]
  @type t :: %__MODULE__{
    name: String.t,
    email_address: String.t,
    phone_number: String.t,
    message: String.t
  }
end
