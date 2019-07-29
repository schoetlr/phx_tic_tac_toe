defmodule PhxTicTacToeWeb.MoveController do
  use PhxTicTacToeWeb, :controller
  #use PhxTicTacToeWeb, :view
  alias PhxTicTacToe.{Move, Repo, Board, MoveValidator, Game}
  
  plug :validate_move when action in [:create]

  def create(conn, %{ "move" => move }) do
    { :ok, created_move } = Move.changeset(%Move{}, move) |> Repo.insert()
    
    redirect(conn, to: game_path(conn, :show, created_move.game_id))
  end

  defp validate_move(conn, _opts) do
    %{"row" => row, "col" => col, "game_id" => game_id} = conn.params["move"]
    #require IEx; IEx.pry
    moves = Game.moves(game_id)
    populated_board = Board.populated_board(moves)
    #require IEx; IEx.pry
    case MoveValidator.valid_move?(String.to_integer(row), String.to_integer(col), populated_board) do 
      true ->
        IO.puts ("MOVE WAS VALID")
        conn
      false ->
        IO.puts ("MOVE WAS INVALID")
      #   game = Repo.get(Game, game_id)
      #   serial_board = Board.serialized_board(populated_board)
      #   move_changeset = Move.changeset(%Move{game_id: game_id, player: game.current_player})

      #   Phoenix.View.render PhxTicTacToe.GameView, "show.html", game: game, move_changeset: move_changeset, board: serial_board, display_message: "Move was invalid.  Go again"

      redirect(conn, to: game_path(conn, :show, game_id, status: "invalid_move"))
      |> halt()
    end
  end
end
