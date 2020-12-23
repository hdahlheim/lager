defmodule Lager.SupplyManagement.Supplier do
  use Lager.Schema
  import Ecto.Changeset

  @fieldes ~w(name street zip city email phone website)a
  @required_fields ~w(name street zip city website)a

  schema "suppliers" do
    field :name, :string
    field :street, :string
    field :zip, :string
    field :city, :string
    field :email, :string
    field :phone, :string
    field :website, :string

    timestamps()
  end

  @doc false
  def changeset(supplier, attrs) do
    supplier
    |> cast(attrs, @fieldes)
    |> validate_required(@required_fields)
  end
end
