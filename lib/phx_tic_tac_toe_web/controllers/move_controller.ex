defmodule PhxTicTacToeWeb.MoveController do
  use PhxTicTacToeWeb, :controller
  #use PhxTicTacToeWeb, :view
  alias PhxTicTacToe.{Move, Repo, Board, MoveValidator, Game}
  
  plug :assign_moves when action in [:create]
  plug :validate_move when action in [:create]

  def create(conn, %{ "move" => move }) do
    { :ok, created_move } = Move.changeset(%Move{}, move) |> Repo.insert()
    
    redirect(conn, to: game_path(conn, :show, created_move.game_id, move_made: "true"))
  end

  defp validate_move(conn, _opts) do
    %{"row" => row, "col" => col, "game_id" => game_id} = conn.params["move"]
    #require IEx; IEx.pry
    moves = conn.assigns[:moves]
    populated_board = Board.populated_board(moves)
    #require IEx; IEx.pry
    case MoveValidator.valid_move?(String.to_integer(row), String.to_integer(col), populated_board) do 
      true ->
        IO.puts ("MOVE WAS VALID")
        conn
      false ->
        IO.puts ("MOVE WAS INVALID")

        redirect(conn, to: game_path(conn, :show, game_id, status: "invalid_move"))
        |> halt()
    end
  end

  defp assign_moves(conn, _opts) do
    %{"game_id" => game_id} = conn.params["move"] 
    moves = Game.moves(game_id)

    conn |> assign(:moves, moves)

  end
end
