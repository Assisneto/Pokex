defmodule Pokex.Trainer.Pokemon.Update do
  @moduledoc """
  Module of Update trainers
  """
  alias Pokex.{Repo, Trainer.Pokemon}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, _uuid} -> update_pokemon(params)
    end
  end

  defp update_pokemon(%{"id" => uuid} = params) do
    case fetch_pokemon(uuid) do
      nil -> {:error, "pokemon not found"}
      pokemon -> update_pokemon(pokemon, params)
    end
  end

  defp fetch_pokemon(uuid), do: Repo.get(Pokemon, uuid)

  defp update_pokemon(pokemon, params),
    do:
      pokemon
      |> Pokemon.update_changeset(params)
      |> Repo.update()
end
