defmodule LagerWeb.Products do
  use LagerWeb, :live_view

  alias Lager.Catalog

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket = assign(socket, products: Catalog.list_products)
    {:ok, socket, temporary_assigns: [products: []]}
  end
end
