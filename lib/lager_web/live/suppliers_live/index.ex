defmodule LagerWeb.SuppliersLive.Index do
  use LagerWeb, :live_view

  alias Lager.SupplyManagement

  def mount(_params, _session, socket) do
    socket = assign(socket, suppliers: SupplyManagement.list_suppliers())
    {:ok, socket, temporary_assigns: [suppliers: []]}
  end
end
