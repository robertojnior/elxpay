defmodule Elxpay.Users.Create do
  alias Elxpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
