defmodule PhxTicTacToeWeb.GameController do
  use PhxTicTacToeWeb, :controller
  alias PhxTicTacToe.Game
  alias PhxTicTacToe.Repo
  alias PhxTicTacToe.Move
  alias PhxTicTacToe.Board

  def index(conn, _params) do
    changeset = Game.changeset(%Game{})
    games = Game.games

    render conn, "index.html", changeset: changeset, games: games
  end

  def create(conn, %{ "game" => game }) do 
    
    {:ok, created_game} = Game.changeset(%Game{}, game)
    |> Repo.insert()
    #pass an id to the below
    redirect(conn, to: game_path(conn, :show, created_game.id))
  end

  def show(conn, %{ "id" => id}) do 
    game = Repo.get(Game, id)
    #used for creating new moves
    move_changeset = Move.changeset(%Move{game_id: id, player: game.current_player})

    #create a board
    moves = Game.moves(id)
    populated_board = Board.populated_board(moves)
    serial_board = Board.serialized_board(populated_board)

    #run game over logic on board

    render conn, "show.html", game: game, move_changeset: move_changeset, board: serial_board
  end

  
end
