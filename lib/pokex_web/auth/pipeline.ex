defmodule PokexWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :pokex

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
