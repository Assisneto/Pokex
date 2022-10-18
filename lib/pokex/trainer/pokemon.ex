defmodule Pokex.Trainer.Pokemon do
  @moduledoc """
  Changeset of Trainers
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  @foreign_key_type Ecto.UUID

  alias Pokex.Trainer

  schema "pokemons" do
    field :name, :string
    field :nickname, :string
    field :weight, :integer
    field :types, {:array, :string}
    belongs_to(:trainer, Trainer)
    timestamps()
  end

  @required [:name, :nickname, :weight, :types, :trainer_id]

  def build(params),
    do:
      params
      |> changeset()
      |> apply_action(:insert)

  def changeset(params),
    do:
      %__MODULE__{}
      |> cast(params, @required)
      |> validate_required(@required)
      |> assoc_constraint(:trainer)
      |> validate_length(:nickname, min: 2)
end
