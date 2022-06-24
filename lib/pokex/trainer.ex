defmodule Pokex.Trainer do
  @moduledoc """
  Changeset of Trainers
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "trainers" do
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    timestamps()
  end

  @required_params [:name, :password]

  def build(params),
    do:
      params
      |> changeset()
      |> apply_action(:insert)

  def changeset(params),
    do: create_changeset(%__MODULE__{}, params)

  def changeset(trainer, params),
    do: create_changeset(trainer, params)

  defp create_changeset(%__MODULE__{} = trainer, params),
    do:
      trainer
      |> cast(params, @required_params)
      |> validate_required(@required_params)
      |> validate_length(:password, min: 6)
      |> put_pass_hash()

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset),
    do: change(changeset, Argon2.add_hash(password))

  defp put_pass_hash(changeset), do: changeset
end
