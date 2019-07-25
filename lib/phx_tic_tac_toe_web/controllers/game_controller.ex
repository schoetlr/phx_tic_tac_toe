defmodule PhxTicTacToeWeb.GameController do
  use PhxTicTacToeWeb, :controller
  alias PhxTicTacToe.{Game, Repo, Move, Board, EndGameLogic}

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
    

    #create a board
    moves = Game.moves(id)
    populated_board = Board.populated_board(moves)
    serial_board = Board.serialized_board(populated_board)

    #run game over logic on board
    #if it isn't over then switch player and display who's turn it is in the message
    case EndGameLogic.game_over?(populated_board) do 
      true ->
        IO.puts "TRIGGERED"
        #TODO: need to update game with a winner
        move_changeset = Move.changeset(%Move{game_id: id, player: game.current_player})
        render conn, "show.html", game: game, move_changeset: move_changeset, board: serial_board, display_message: "Game Over"
      false ->
        IO.puts "FALSE TRIGGERED"
        #run logic corresponding to the game still being active
        game = Game.switch_current_player(game)
        move_changeset = Move.changeset(%Move{game_id: id, player: game.current_player})
        render conn, "show.html", game: game, move_changeset: move_changeset, board: serial_board, display_message: "It is #{game.current_player}'s turn"
      
    end


  end

  
end
