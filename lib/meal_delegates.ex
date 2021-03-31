defmodule MealDelegates do
  alias Meal.Meals.Create, as: MealCreate

  defdelegate create_meal(params), to: MealCreate, as: :call

end
