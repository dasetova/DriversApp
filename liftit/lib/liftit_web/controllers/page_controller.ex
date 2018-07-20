defmodule LiftitWeb.PageController do
  use LiftitWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
