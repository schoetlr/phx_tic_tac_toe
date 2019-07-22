defmodule PhxTicTacToeWeb.GameController do
  use PhxTicTacToeWeb, :controller
  alias PhxTicTacToe.Game
  
  def index(conn, _params) do
    changeset = Game.changeset(%Game{})
    
    render conn, "index.html", changeset: changeset
  end
end
