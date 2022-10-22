defmodule PokexWeb.TrainerPokemonsController do
  use PokexWeb, :controller

  action_fallback PokexWeb.FallbackController

  def create(conn, params),
    do:
      params
      |> Pokex.create_trainer_pokemon()
      |> handle_response(conn, "create.json", :created)

  def delete(conn, %{"id" => id}),
    do:
      id
      |> Pokex.delete_trainer_pokemon()
      |> handle_delete(conn)

  defp handle_delete({:ok, _pokemon}, conn),
    do:
      conn
      |> put_status(:no_content)
      |> text("")

  defp handle_delete({:error, _changeset} = error, _conn), do: error

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error

  defp handle_response({:ok, pokemon}, conn, view, status),
    do:
      conn
      |> put_status(status)
      |> render(view, pokemon: pokemon)
end
