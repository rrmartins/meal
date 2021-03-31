defmodule Meal.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Meal.Meal

  def meal_params_factory do
    %{
      description: "Misto quente",
      calories: "213"
    }
  end

  def meal_factory do
    %Meal{
      description: "Misto quente",
      calories: "213",
      id: "7425ecb1-a6d4-4737-b2f9-89fae26b5a8b"
    }
  end
end
