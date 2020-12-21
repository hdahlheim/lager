defmodule LagerWeb.StatsComponent do
  @moduledoc false
  use LagerWeb, :live_component

  @impl Phoenix.LiveComponent
  def render(assigns) do
    ~L"""
    <div class="overflow-hidden bg-white rounded-lg shadow">
      <div class="px-4 py-5 sm:p-6">
        <dt class="text-sm font-medium text-gray-500 truncate">
          <%= @title %>
        </dt>
        <dd class="mt-1 text-3xl font-semibold text-gray-900">
          <%= @content %>
        </dd>
      </div>
    </div>
    """
  end
end
