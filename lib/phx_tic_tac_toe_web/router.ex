defmodule PhxTicTacToeWeb.Router do
  use PhxTicTacToeWeb, :router

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

  scope "/", PhxTicTacToeWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/games", GameController
    post "/moves", MoveController, only: [:create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhxTicTacToeWeb do
  #   pipe_through :api
  # end
end
