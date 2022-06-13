defmodule Pokex.Repo do
  use Ecto.Repo,
    otp_app: :pokex,
    adapter: Ecto.Adapters.Postgres
end
