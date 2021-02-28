defmodule ElxpayWeb.Users.CreateView do
  use ElxpayWeb, :view

  alias Elxpay.User

  def render("create.json", %{user: %User{id: id, name: name, username: username}}) do
    %{id: id, name: name, username: username}
  end
end
