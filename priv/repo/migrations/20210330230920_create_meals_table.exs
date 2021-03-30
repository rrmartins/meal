defmodule Meal.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table(:meals) do
      add :description, :string
      add :date, :naive_datetime
      add :calories, :string

      timestamps()
    end
  end
end
