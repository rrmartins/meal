defmodule MealWeb.MealsController do
  use MealWeb, :controller

  alias Meal.Meal
  alias MealWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- MealDelegates.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end
end
