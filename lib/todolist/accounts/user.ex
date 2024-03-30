defmodule Todolist.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :password, :string
    field :salt, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
  end

  @doc false
  def hash_password_and_salt(changeset) do
    password = Ecto.Changeset.get_change(changeset, :password)
    {hashed_password, salt} = PasswordHash.hash_password(password)

    changeset
    |> Ecto.Changeset.put_change(:password, hashed_password)
    |> Ecto.Changeset.put_change(:salt, salt)
  end
end
