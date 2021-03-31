defmodule Meal.MealTest do
  use Meal.DataCase, async: true

  import Meal.Factory

  alias Ecto.Changeset
  alias Meal.Meal

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:meal_params)

      response = Meal.changeset(params)

      assert %Changeset{changes: %{description: "Misto quente"}, valid?: true} = response
    end

    test "when updating a changeset, retuns a valid changeset with the given changes" do
      params = build(:meal_params)

      update_params = %{
        description: "Francesinha"
      }

      response =
        params
        |> Meal.changeset()
        |> Meal.changeset(update_params)

      assert %Changeset{changes: %{description: "Francesinha"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = build(:meal_params, calories: nil)

      response = Meal.changeset(params)

      expected_response = %{calories: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
