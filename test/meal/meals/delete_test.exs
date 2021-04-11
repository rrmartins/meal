defmodule Meal.Meals.DeleteTest do
  use Meal.DataCase, async: true

  import Meal.Factory

  alias Meal.Meals.Delete
  alias Meal.{Error, Meal}

  describe "call/1" do
    test "when meal exists, deletes the meal" do
      meal_id = "47d5430a-9569-40d7-9a33-222aaedb8e29"
      user_id = "e89614f0-dd7c-4a9e-b474-c83ec212a5bc"

      insert(:user, id: user_id)
      insert(:meal, id: meal_id, user_id: user_id)

      response =
        "47d5430a-9569-40d7-9a33-222aaedb8e29"
        |> Delete.call()

      assert {
               :ok,
               %Meal{
                 id: _id,
                 description: "Misto quente",
                 publication_date: ~U[2021-03-28 13:59:13Z],
                 calories: "300",
                 user_id: _user_id
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
