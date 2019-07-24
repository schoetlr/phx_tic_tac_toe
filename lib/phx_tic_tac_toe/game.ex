defmodule PhxTicTacToe.Game do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhxTicTacToe.Repo
  alias PhxTicTacToe.Game
  alias PhxTicTacToe.Move
  import Ecto.Query
  import Ecto.Queryable

  schema "games" do
    field :player_one_name, :string
    field :player_two_name, :string
    field :winner, :string
    field :current_player, :string
    has_many :moves, PhxTicTacToe.Move

    timestamps()
  end

  @doc false
  def changeset(game, attrs \\ %{}) do
    game
    |> cast(attrs, [:player_one_name, :player_two_name, :winner, :current_player])
    |> validate_required([:player_one_name, :player_two_name])
  end

  def games do 
    query = from g in Game, 
            select: g,
            order_by: [desc: g.inserted_at]


    Repo.all(query)
  end

  def moves(game_id) do
    game_id = String.to_integer(game_id) 
    game = Repo.all(from g in Game, where: g.id == ^game_id, preload: [:moves]) |> hd
    game.moves
  end
end
