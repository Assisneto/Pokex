defmodule Pokex do
  @moduledoc """
  Pokex keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Pokex.Trainer

  defdelegate create_trainer(params), to: Trainer.Create, as: :call
end
