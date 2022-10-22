defmodule Pokex.Trainer.Pokemon.Delete do
  @moduledoc """
  Module of Delete trainers
  """
  alias Pokex.{Repo, Trainer.Pokemon}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> delete_trainer(uuid)
    end
  end

  defp delete_trainer(uuid) do
    case fetch_pokemon(uuid) do
      nil -> {:error, "Pokemon not found"}
      pokemon -> Repo.delete(pokemon)
    end
  end

  defp fetch_pokemon(uuid), do: Repo.get(Pokemon, uuid)
end
