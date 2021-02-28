defmodule ElxpayWeb.FallbackController do
  use ElxpayWeb, :controller

  def call(conn, {:error, failed_value}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(ElxpayWeb.ErrorView)
    |> render("422.json", failed_value: failed_value)
  end
end
