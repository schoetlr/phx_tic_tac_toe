defmodule PhxTicTacToeWeb.PageController do
  use PhxTicTacToeWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
