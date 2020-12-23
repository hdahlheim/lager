defmodule Lager.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :unit_volume, :float
      add :unit_type, :string

      timestamps()
    end

  end
end
