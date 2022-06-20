defmodule PokexWeb.TrainersController do
  use PokexWeb, :controller

  def create(conn, params),
    do:
      params
      |> Pokex.create_trainer()
      |> handle_response(conn)

  defp handle_response({:ok, trainer}, conn),
    do:
      conn
      |> put_status(:created)
      |> render("create.json", trainer: trainer)
end
