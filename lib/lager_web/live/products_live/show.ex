defmodule LagerWeb.ProductsLive.Show do
  use LagerWeb, :live_view

  alias Lager.Catalog

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    product = Catalog.get_product!(id)

    {:noreply,
     socket
     |> assign(:product, product)
     |> assign(:page_title, page_title(socket.assigns.live_action, product))}
  end

  defp page_title(:show, product), do: "#{product.name}"
  defp page_title(:edit, product), do: "Produkt #{product.name} Bearbeiten"
end
