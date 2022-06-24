defmodule Pokex.Trainer.Delete do
  @moduledoc """
  Module of Delete trainers
  """
  alias Pokex.{Repo, Trainer}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> delete_trainer(uuid)
    end
  end

  defp delete_trainer(uuid) do
    case fetch_trainer(uuid) do
      nil -> {:error, "Trainer not found"}
      trainer -> Repo.delete(trainer)
    end
  end

  defp fetch_trainer(uuid), do: Repo.get(Trainer, uuid)
end
