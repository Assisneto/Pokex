defmodule Pokex.Pokemon.Get do
  @moduledoc """
  Module of get pokemon
  """
  alias Pokex.PokeApi.Client
  alias Pokex.Pokemon

  def call(name),
    do:
      name
      |> Client.get_pokemon()
      |> handle_response()

  defp handle_response({:ok, body}), do: {:ok, Pokemon.build(body)}
  defp handle_response({:error, _reason} = error), do: error
end
