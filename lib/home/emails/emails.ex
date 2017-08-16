defmodule Platform.Emails do
  @moduledoc """
  The boundary of the email system.
  """

  import Bamboo.Email
  # use Bamboo.Phoenix, view: PlatformWeb.EmailView

  @from "noreply@ahmet.pro"

  # def build_accepted_apprentice(apprentice) do
  #   new_email()
  #   |> to("admin@ahmet.pro")
  #   |> from(@from)
  #   |> subject("Apprenticeship Application - Next Step - WhiteHat Kick-Off Day invite")
  #   |> assign(:apprentice, apprentice)
  #   |> render("accepted_apprentice.html")
  # end

  # def build_rejected_apprentice(apprentice) do
  #   new_email()
  #   |> to(apprentice.email)
  #   |> from(@from)
  #   |> subject("We’ve reviewed your application")
  #   |> assign(:apprentice, apprentice)
  #   |> render("rejected_apprentice.html")
  # end
end
