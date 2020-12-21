defmodule Lager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Lager.Repo,
      # Start the Telemetry supervisor
      LagerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Lager.PubSub},
      # Start the Endpoint (http/https)
      LagerWeb.Endpoint
      # Start a worker by calling: Lager.Worker.start_link(arg)
      # {Lager.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Lager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LagerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
