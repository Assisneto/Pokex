defmodule Pokex do
  @moduledoc """
  Pokex keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Pokex.{Pokemon, Trainer}
  alias Trainer.Pokemon, as: TrainerPokemon

  defdelegate create_trainer(params), to: Trainer.Create, as: :call
  defdelegate delete_trainer(params), to: Trainer.Delete, as: :call
  defdelegate fetch_trainer(params), to: Trainer.Get, as: :call
  defdelegate update_trainer(params), to: Trainer.Update, as: :call

  defdelegate fetch_pokemon(params), to: Pokemon.Get, as: :call
  defdelegate create_trainer_pokemon(params), to: TrainerPokemon.Create, as: :call
  defdelegate delete_trainer_pokemon(params), to: TrainerPokemon.Delete, as: :call
  defdelegate fetch_trainer_pokemon(params), to: TrainerPokemon.Get, as: :call

  defdelegate update_trainer_pokemon(params), to: TrainerPokemon.Update, as: :call
end
