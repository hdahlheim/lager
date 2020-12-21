defmodule Lager.Repo do
  use Ecto.Repo,
    otp_app: :lager,
    adapter: Ecto.Adapters.Postgres
end
