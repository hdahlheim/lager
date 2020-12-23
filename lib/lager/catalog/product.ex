defmodule Lager.Catalog.Product do
  use Lager.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :unit_type, :string
    field :unit_volume, :float

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :unit_volume, :unit_type])
    |> validate_required([:name, :unit_volume, :unit_type])
  end
end
