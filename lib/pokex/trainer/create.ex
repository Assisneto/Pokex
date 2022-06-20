defmodule Pokex.Trainer.Create do
  @moduledoc """
  Module of create trainers
  """
  alias Pokex.{Repo, Trainer}

  def call(params),
    do:
      params
      |> Trainer.build()
      |> create_trainer()

  defp create_trainer({:ok, changeset}), do: Repo.insert(changeset)
  defp create_trainer({:error, _changeset} = error), do: error
end
