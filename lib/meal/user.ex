defmodule Meal.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Meal.Meal

  @primary_key {:id, :binary_id, autogenerate: true}

  @require_params [:name, :cpf, :email]

  @derive {Jason.Encoder, only: [:id, :name, :cpf, :email]}

  schema "users" do
    field :name, :string
    field :cpf, :string
    field :email, :string

    has_many :meals, Meal

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @require_params)
    |> validate_required(@require_params)
  end
end
