defmodule Lager.Inventory.Item do
  use Lager.Schema
  import Ecto.Changeset
  alias Lager.Catalog.Product

  schema "inventory_items" do
    field :quantity, :integer
    belongs_to :product, Product

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:quantity, :product_id])
    |> validate_required([:quantity, :product_id])
  end
end
