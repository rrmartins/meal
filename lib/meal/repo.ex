defmodule Meal.Repo do
  use Ecto.Repo,
    otp_app: :meal,
    adapter: Ecto.Adapters.Postgres
end
