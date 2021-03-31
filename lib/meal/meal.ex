defmodule Meal.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @require_params [:description, :publication_date, :calories]

  @derive {Jason.Encoder, only: [:id, :description, :publication_date, :calories]}

  schema "meals" do
    field :description, :string
    field :publication_date, :utc_datetime
    field :calories, :string

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @require_params)
    |> validate_required(@require_params)
  end
end
