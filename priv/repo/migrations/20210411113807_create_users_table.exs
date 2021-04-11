defmodule Meal.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table :users do
      add :name, :string
      add :cpf, :string
      add :email, :string

      timestamps()
    end

    alter table :meals do
      add :user_id, references(:users, type: :binary_id)
    end
  end
end
