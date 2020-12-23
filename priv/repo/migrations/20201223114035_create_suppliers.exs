defmodule Lager.Repo.Migrations.Suppliers do
  use Ecto.Migration

  def change do
    create table(:suppliers) do
      add :name, :string
      add :street, :string
      add :zip, :string
      add :city, :string
      add :email, :string
      add :phone, :string
      add :website, :string

      timestamps()
    end
  end
end
