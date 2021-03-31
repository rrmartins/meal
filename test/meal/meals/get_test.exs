defmodule Meal.Meals.GetTest do
  use Meal.DataCase, async: true

  import Meal.Factory

  alias Meal.Meals.Get
  alias Meal.{Error, Meal}

  describe "by_id/1" do
    test "when meal exists, returns the meal" do
      insert(:meal)

      response =
        "47d5430a-9569-40d7-9a33-222aaedb8e29"
        |> Get.by_id()

      assert {
               :ok,
               %Meal{
                 id: _id,
                 description: "Misto quente",
                 calories: "300",
                 publication_date: ~U[2021-03-28 13:59:13Z]
               }
             } = response
    end

    test "when the meal not exits, returns an error" do
      response =
        "47d5430a-9569-40d7-9a33-222aaedb8e29"
        |> Get.by_id()

      assert {
               :error,
               %Error{
                 result: "meal not found",
                 status: :not_found
               }
             } = response
    end
  end
end
