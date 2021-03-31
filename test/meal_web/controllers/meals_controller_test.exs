defmodule MealWeb.MealsControllerTest do
  use MealWeb.ConnCase, async: true

  import Meal.Factory

  describe "create/2" do
    test "when all params are valid, creates the meal", %{conn: conn} do
      params = %{
        "description" => "Pao",
        "publication_date" => "2021-03-26T13:59:13Z",
        "calories" => "213213"
      }

      response = conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Meal created",
               "meal" => %{
                  "description" => "Pao",
                  "publication_date" => "2021-03-26T13:59:13Z",
                  "calories" => "213213",
                  "id" => _id
               }
             } = response
    end

    test "when there is some error, returns teh error", %{conn: conn} do
      params = %{}

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{"calories" => ["can't be blank"], "description" => ["can't be blank"], "publication_date" => ["can't be blank"]}
      }

      assert expected_response == response
    end
  end
end
