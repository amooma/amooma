defmodule Amooma.Web.Router do
  use Amooma.Web, :router

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

  scope "/", Amooma.Web do
    pipe_through :browser # Use the default browser stack

    # get "/", PageController, :index
    get "/newsletters", RailsSubscriptionController, :new
    resources "/rails_subscriptions", RailsSubscriptionController, only: [:new, :create, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Amooma.Web do
  #   pipe_through :api
  # end
end
