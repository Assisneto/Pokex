defmodule PokexWeb.FallbackController do
  use PokexWeb, :controller

  def call(conn, {:error, result}),
    do:
      conn
      |> put_status(:bad_request)
      |> put_view(PokexWeb.ErrorView)
      |> render("400.json", result: result)
end
