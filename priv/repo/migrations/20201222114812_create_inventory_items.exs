defmodule Lager.Repo.Migrations.CreateInventoryItems do
  use Ecto.Migration

  def change do
    create table(:inventory_items) do
      add :quantity, :integer
      add :product_id, references(:products, on_delete: :nothing)

      timestamps()
    end

    create index(:inventory_items, [:product_id])
  end
end
