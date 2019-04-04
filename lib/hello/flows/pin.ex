defmodule Hello.Flows.Pin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pin" do
    field :msisdn, :string
    field :pin, :string

    timestamps()
  end

  @doc false
  def changeset(pin, attrs) do
    pin
    |> cast(attrs, [:msisdn, :pin])
    |> validate_required([:msisdn, :pin])
    |> validate_format(:msisdn, ~r/^[0-9]*$/, message: "only numbers please")
    |> validate_format(:pin, ~r/^[0-9]*$/, message: "only numbers please")
    |> validate_length(:msisdn, min: 8, max: 12)
    |> validate_length(:pin, min: 4, max: 4)
  end

  @doc false
  def changeset_msisdn(pin, attrs) do
    pin
    |> cast(attrs, [:msisdn])
    |> validate_required([:msisdn])
    |> validate_format(:msisdn, ~r/^[0-9]*$/, message: "only numbers please")
    |> validate_length(:msisdn, min: 8, max: 12)
  end
end
