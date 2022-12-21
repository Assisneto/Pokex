defmodule PokexWeb.Auth.Guardian do
  use Guardian, otp_app: :pokex

  alias Pokex.{Repo, Trainer}

  def subject_for_token(%{id: id}, _claims) do
    sub = to_string(id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(%{"sub" => id}) do
    resource = Pokex.fetch_trainer(id)
    {:ok, resource}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end

  def authenticate(%{"id" => trainer_id, "password" => password}) do
    IO.inspect(trainer_id)

    case Repo.get(Trainer, trainer_id) do
      nil -> {:error, "Trainer not found!"}
      trainer -> validate_password(trainer, password)
    end
  end

  defp validate_password(%Trainer{password_hash: hash} = trainer, password) do
    case Argon2.verify_pass(password, hash) do
      true -> create_token(trainer)
      false -> {:error, :unauthorized}
    end
  end

  defp create_token(trainer) do
    {:ok, token, _claims} = encode_and_sign(trainer)
    {:ok, token}
  end
end
