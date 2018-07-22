defmodule LiftitWeb.Router do
  use LiftitWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiftitWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/owners", OwnerController
    resources "/vehicles", VehicleController
  end

end
