defmodule Todolist.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todolist.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        password: "some password",
        username: "some username"
      })
      |> Todolist.Accounts.create_user()

    user
  end
end
