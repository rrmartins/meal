defmodule Meal.Meals.DeleteTest do
  use Meal.DataCase, async: true

  import Meal.Factory

  alias Meal.Meals.Delete
  alias Meal.{Error, Meal}

  describe "call/1" do
    test "when meal exists, deletes the meal" do
      insert(:meal)

      response =
        "47d5430a-9569-40d7-9a33-222aaedb8e29"
        |> Delete.call()

      assert {
               :ok,
               %Meal{
                 id: _id,
                 description: "Misto quente",
                 publication_date: ~U[2021-03-28 13:59:13Z],
                 calories: "300"
               }
             } = response
    end

    test "when meal not exists, ruturns an error" do
      response =
        "47d5430a-9569-40d7-9a33-222aaedb8e29"
        |> Delete.call()

      assert {
               :error,
               %Error{
                 result: "meal not found",
                 status: :not_found
               }
             } == response
    end
  end
end
