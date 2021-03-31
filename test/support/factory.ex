defmodule Meal.Factory do
  use ExMachina.Ecto, repo: Meal.Repo

  alias Meal.Meal

  def meal_params_factory do
    %{
      description: "Misto quente",
      calories: "213",
      publication_date: "2021-03-26T13:59:13Z"
    }
  end

  def meal_factory do
     %Meal{
      id: "47d5430a-9569-40d7-9a33-222aaedb8e29",
      description: "Misto quente",
      calories: "300",
      publication_date: ~U[2021-03-28 13:59:13Z]
    }
  end
end
