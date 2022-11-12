defmodule PokexWeb.TrainersView do
  use PokexWeb, :view

  alias Pokex.Trainer

  def render(
        "create.json",
        %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}, token: token}
      ),
      do: %{
        message: "Created",
        trainer: %{
          id: id,
          name: name,
          inserted_at: inserted_at
        },
        token: token
      }

  def render("show.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}}),
    do: %{
      id: id,
      name: name,
      inserted_at: inserted_at
    }

  def render("update.json", %{
        trainer: %Trainer{id: id, name: name, inserted_at: inserted_at, updated_at: updated_at}
      }),
      do: %{
        message: "Update",
        trainer: %{
          id: id,
          name: name,
          inserted_at: inserted_at,
          updated_at: updated_at
        }
      }
end
