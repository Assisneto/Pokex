defmodule Pokex.PokeApi.Client do
  @moduledoc """
  Module of Client http
  """
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://pokeapi.co/api/v2"
  plug Tesla.Middleware.JSON

  def get_pokemon(name),
    do:
      "/pokemon/#{name}"
      |> get()
      |> handle_get()

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}), do: {:ok, body}

  defp handle_get({:ok, %Tesla.Env{status: 404}}),
    do: {:error, %{message: "Pokemon not found!", status: 404}}

  defp handle_get({:error, _reason} = error), do: error
end
