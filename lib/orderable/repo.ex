defmodule Orderable.Repo do
  use Ecto.Repo,
    otp_app: :orderable,
    adapter: Ecto.Adapters.Postgres
end
