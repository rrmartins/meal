defmodule Meal.Meal do
  use Ecto.Schema
  import Ecto.Changeset
  alias Meal.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @require_params [:description, :publication_date, :calories, :user_id]

  @derive {Jason.Encoder, only: @require_params ++ [:id]}

  schema "meals" do
    field :description, :string
    field :publication_date, :utc_datetime
    field :calories, :string

    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @require_params)
    |> validate_required(@require_params)
  end
end
