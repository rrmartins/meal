defmodule Meal.Users.CreateTest do
  use Meal.DataCase, async: true

  import Meal.Factory

  alias Meal.Meals.Create
  alias Meal.{Error, Meal}


  describe "call/1" do
    test "when all params are valid, returns the meal" do
      user_id = "d3269a1f-c362-4396-866b-7373abadea38"

      insert(:user, id: user_id)

      params = build(:meal_params, user_id: user_id)

      response = Create.call(params)

      assert {:ok, %Meal{id: _id, description: "Misto quente"}} = response
    end

    test "when there are invalid params, returns an meal" do
      params = build(:meal_params, %{calories: nil, description: ""})

      response = Create.call(params)

      expected_response = %{calories: ["can't be blank"], description: ["can't be blank"]}

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
