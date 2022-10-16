defmodule PokexWeb.PokemonsController do
  use PokexWeb, :controller

  action_fallback PokexWeb.FallbackController

  def show(conn, %{"name" => name}),
    do:
      name
      |> Pokex.fetch_pokemon()
      |> handle_response(conn)

  defp handle_response({:ok, pokemon}, conn),
    do:
      conn
      |> put_status(:ok)
      |> json(pokemon)

  # defp handle_response({:error, %{status: 404, message: message}}, conn),
  #   do:
  #     conn
  #     |> put_status(:not_found)
  #     |> json(message)

  defp handle_response({:error, _reason} = error, _conn), do: error
end
