defmodule MealDelegates do

  alias Meal.Meals.Create, as: MealCreate
  alias Meal.Meals.Delete, as: MealDelete
  alias Meal.Meals.Get, as: MealGet
  alias Meal.Meals.Update, as: MealUpdate

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate update_meal(params), to: MealUpdate, as: :call
  defdelegate get_meal_by_id(id), to: MealGet, as: :by_id
  defdelegate delete_meal(id), to: MealDelete, as: :call
end
