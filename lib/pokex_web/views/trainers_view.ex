defmodule PokexWeb.TrainersView do
  use PokexWeb, :view

  alias Pokex.Trainer

  def render("create.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}}),
    do: %{
      message: "Created",
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at
      }
    }

  def render("show.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}}),
    do: %{
      id: id,
      name: name,
      inserted_at: inserted_at
    }
end
