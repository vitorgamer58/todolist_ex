defmodule PasswordHash do
  def generate_salt do
    :crypto.strong_rand_bytes(16) |> Base.encode64()
  end

  def hash_password(password) do
    salt = generate_salt()

    hashed_password =
      :crypto.hash(:sha256, salt <> password)
      |> Base.encode64()

    {hashed_password, salt}
  end

  def hash_password(password, salt) do
    hashed_password =
      :crypto.hash(:sha256, salt <> password)
      |> Base.encode64()

    {hashed_password, salt}
  end

  def compare_hash(salt, password, stored_hash) do
    {hashed_password, _salt} = hash_password(password, salt)
    :crypto.hash_equals(hashed_password, stored_hash)
  end
end
