defmodule Lager.SupplyManagement do
  @moduledoc """
  The Supply Management context
  """

  import Ecto.Query, warn: false
  alias Lager.Repo

  alias Lager.SupplyManagement.Supplier


  @doc """
  Returns the list of suppliers.

  ## Examples

      iex> list_suppliers()
      [%Supplier{}, ...]

  """
  def list_suppliers do
    Repo.all(Supplier)
  end

  def register_supplier(attrs \\ %{}) do
    %Supplier{}
    |> Supplier.changeset(attrs)
    |> Repo.insert()
  end

end
