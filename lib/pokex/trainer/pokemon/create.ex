defmodule Pokex.Trainer.Pokemon.Create do
  alias Pokex.Pokemon
  alias Pokex.Repo
  alias Pokex.PokeApi.Client
  alias Pokex.Trainer.Pokemon, as: TrainerPokemon

  def call(%{"name" => name} = params),
    do:
      name
      |> Client.get_pokemon()
      |> handle_response(params)

  defp handle_response({:ok, body}, params),
    do:
      body
      |> Pokemon.build()
      |> create_pokemon(params)

  defp handle_response({:error, _msg} = error, _params), do: error

  defp create_pokemon(%Pokemon{name: name, weight: weight, types: types}, %{
         "nickname" => nickname,
         "trainer_id" => trainer_id
       }),
       do:
         %{
           name: name,
           weight: weight,
           types: types,
           nickname: nickname,
           trainer_id: trainer_id
         }
         |> TrainerPokemon.build()
         |> handle_build()

  defp handle_build({:ok, pokemon}), do: Repo.insert(pokemon)
  defp handle_build({:error, _changeset} = error), do: error
end
