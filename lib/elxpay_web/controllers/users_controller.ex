defmodule ElxpayWeb.UsersController do
  use ElxpayWeb, :controller

  alias Elxpay.User

  action_fallback ElxpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Elxpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
