defmodule PhxTicTacToeWeb.GameController do
  use PhxTicTacToeWeb, :controller
  alias PhxTicTacToe.Game
  alias PhxTicTacToe.Repo
  alias PhxTicTacToe.Move

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
    move_changeset = Move.changeset(%Move{game_id: id})

    render conn, "show.html", game: game, move_changeset: move_changeset
  end
end
