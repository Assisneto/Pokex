defmodule Pokex.Pokemon do
  @moduledoc """
  Module of Pokemon struct
  """
  @keys [:id, :name, :weight, :types]

  @enforce_keys @keys

  defstruct @keys

  def build(%{"id" => id, "name" => name, "weight" => weight, "types" => types}) do
    %__MODULE__{
      id: id,
      name: name,
      weight: weight,
      types: parse_types(types)
    }
  end

  defp parse_types(types), do: Enum.map(types, fn item -> item["types"]["name"] end)
end
