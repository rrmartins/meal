defmodule Meal.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @require_params [:description, :calories]
  @require_with_params [:description, :date, :calories]

  @derive {Jason.Encoder, only: [:id, :description, :date, :calories]}

  schema "meals" do
    field :description, :string
    field :date, :naive_datetime
    field :calories, :string

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> put_date()
    |> cast(params, @require_params)
    |> validate_required(@require_with_params)
  end

  defp put_date(struct) do
    change(struct, %{date: NaiveDateTime.utc_now()})
  end
end
