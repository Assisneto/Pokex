defmodule PokexWeb.FallbackController do
  use PokexWeb, :controller

  def call(conn, {:error, %{status: 404, message: message}}),
    do:
      conn
      |> put_status(:not_found)
      |> put_view(PokexWeb.ErrorView)
      |> render("400.json", result: message)

  def call(conn, {:error, result}),
    do:
      conn
      |> put_status(:bad_request)
      |> put_view(PokexWeb.ErrorView)
      |> render("400.json", result: result)
end
