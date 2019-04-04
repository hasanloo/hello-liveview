defmodule Hello.Repo.Migrations.CreatePin do
  use Ecto.Migration

  def change do
    create table(:pin) do
      add :msisdn, :string
      add :pin, :string

      timestamps()
    end
  end
end
