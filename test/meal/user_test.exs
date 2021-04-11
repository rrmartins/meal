defmodule Meal.UserTest do
  use Meal.DataCase, async: true

  import Meal.Factory

  alias Ecto.Changeset
  alias Meal.User

  describe "changeset/1" do
    test "when the create params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{
               changes: %{
                 name: "Rodrigo Martins",
                 email: "rrmartinsjg@gmail.com",
                 cpf: "12345678910"
               },
               valid?: true
             } = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{}

      response = User.changeset(params)

      expected_response = %{
        cpf: ["can't be blank"],
        email: ["can't be blank"],
        name: ["can't be blank"]
      }

      assert expected_response == errors_on(response)
    end
  end

  describe "changeset/2" do
    setup %{} do
      params = build(:user_params)

      changeset = User.changeset(params)

      {:ok, changeset: changeset}
    end

    test "when the update params are valid, returns a valid changeset", %{changeset: changeset} do
      params = %{name: "Rodrigo Martins"}

      response =
        changeset
        |> User.changeset(params)

      assert %Changeset{
               changes: %{
                 name: "Rodrigo Martins",
                 email: "rrmartinsjg@gmail.com",
                 cpf: "12345678910"
               },
               valid?: true
             } = response
    end

    test "when there are some error, returns an invalid changeset", %{changeset: changeset} do
      params = %{name: ""}

      response =
        changeset
        |> User.changeset(params)

      expected_response = %{
        name: ["can't be blank"]
      }

      assert expected_response == errors_on(response)
    end
  end
end
