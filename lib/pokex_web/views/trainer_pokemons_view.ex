defmodule PokexWeb.TrainerPokemonsView do
  use PokexWeb, :view

  alias Pokex.Trainer.Pokemon

  def render("create.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          inserted_at: inserted_at,
          weight: weight,
          types: types,
          nickname: nickname,
          trainer_id: trainer_id
        }
      }),
      do: %{
        message: "Pokemon Created",
        trainer: %{
          id: id,
          name: name,
          inserted_at: inserted_at,
          weight: weight,
          types: types,
          nickname: nickname,
          trainer_id: trainer_id
        }
      }

  def render("show.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          inserted_at: inserted_at,
          weight: weight,
          types: types,
          nickname: nickname,
          trainer: %{id: trainer_id, name: trainer_name}
        }
      }),
      do: %{
        trainer: %{
          id: id,
          name: name,
          inserted_at: inserted_at,
          weight: weight,
          types: types,
          nickname: nickname,
          trainer: %{id: trainer_id, name: trainer_name}
        }
      }

  def render("update.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          inserted_at: inserted_at,
          weight: weight,
          types: types,
          nickname: nickname,
          trainer_id: trainer_id
        }
      }),
      do: %{
        message: "Pokemon Update",
        trainer: %{
          id: id,
          name: name,
          inserted_at: inserted_at,
          weight: weight,
          types: types,
          nickname: nickname,
          trainer_id: trainer_id
        }
      }
end
