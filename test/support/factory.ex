defmodule Meal.Factory do
  use ExMachina.Ecto, repo: Meal.Repo

  alias Meal.{User, Meal}

  def meal_params_factory do
    %{
      description: "Misto quente",
      calories: "213",
      publication_date: "2021-03-26T13:59:13Z",
      user_id: "c08e7938-553b-4c07-ab32-69dbcf932bde"
    }
  end

  def meal_factory do
     %Meal{
      id: "47d5430a-9569-40d7-9a33-222aaedb8e29",
      description: "Misto quente",
      calories: "300",
      publication_date: ~U[2021-03-28 13:59:13Z],
      user_id: "c08e7938-553b-4c07-ab32-69dbcf932bde"
    }
  end

  def user_params_factory do
    %{
      name: "Rodrigo Martins",
      cpf: "12345678910",
      email: "rrmartinsjg@gmail.com"
    }
  end

  def user_factory do
    %User{
      id: "c08e7938-553b-4c07-ab32-69dbcf932bde",
      name:  "Rodrigo Martins",
      cpf: "12345678910",
      email: "rrmartinsjg@gmail.com"
    }
  end
end
