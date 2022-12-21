defmodule PokexWeb.TrainersController do
  use PokexWeb, :controller

  alias PokexWeb.Auth.Guardian

  action_fallback PokexWeb.FallbackController

  def create(conn, params) do
    with {:ok, trainer} <- Pokex.create_trainer(params),
         {:ok, token, _claim} <- Guardian.encode_and_sign(trainer) do
      conn
      |> put_status(:created)
      |> render("create.json", %{trainer: trainer, token: token})
    end
  end

  def delete(conn, %{"id" => id}),
    do:
      id
      |> Pokex.delete_trainer()
      |> handle_delete(conn)

  defp handle_delete({:ok, _trainer}, conn),
    do:
      conn
      |> put_status(:no_content)
      |> text("")

  defp handle_delete({:error, _changeset} = error, _conn), do: error

  def show(conn, %{"id" => id}),
    do:
      id
      |> Pokex.fetch_trainer()
      |> handle_response(conn, "show.json", :ok)

  def update(conn, params),
    do:
      params
      |> Pokex.update_trainer()
      |> handle_response(conn, "update.json", :ok)

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end

  defp handle_response({:ok, trainer}, conn, view, status),
    do:
      conn
      |> put_status(status)
      |> render(view, trainer: trainer)

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
