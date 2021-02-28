defmodule Elxpay.Repo do
  use Ecto.Repo,
    otp_app: :elxpay,
    adapter: Ecto.Adapters.Postgres
end
