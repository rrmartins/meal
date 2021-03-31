defmodule Meal.Meals.UpdateTest do
  use Meal.DataCase, async: true

  import Meal.Factory

  alias Meal.Meals.Update
  alias Meal.{Error, Meal}

  describe "call/1" do
    test "when meal exists, updates the meal" do
      insert(:meal)

      params = %{
        "id" => "47d5430a-9569-40d7-9a33-222aaedb8e29",
        "description" => "Abacate"
      }

      response =
        params
        |> Update.call()

      assert {
               :ok,
               %Meal{
                 id: _id,
                 description: "Abacate",
                 calories: "300",
                 publication_date: ~U[2021-03-28 13:59:13Z]
               }
             } = response
    end

    test "when meal not exists, returns an error" do
      params = %{
        "id" => "47d5430a-9569-40d7-9a33-222aaedb8e29",
        "description" => "Abacate"
      }

      response =
        params
        |> Update.call()

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
