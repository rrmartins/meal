defmodule MealDelegates do
  alias Meal.Meals.Create, as: MealCreate
  alias Meal.Meals.Update, as: MealUpdate

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate update_meal(params), to: MealUpdate, as: :call
end
