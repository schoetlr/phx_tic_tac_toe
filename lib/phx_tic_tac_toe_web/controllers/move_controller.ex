defmodule PhxTicTacToeWeb.MoveController do
  use PhxTicTacToeWeb, :controller
  alias PhxTicTacToe.Move
  
  def create(conn, %{ "move" => move }) do
    { :ok, created_move } = Move.changeset(%Move{}, move)
    |> Repo.insert()

    redirect(conn, to: game_path(conn, :show, created_move.game_id))
  end
end
