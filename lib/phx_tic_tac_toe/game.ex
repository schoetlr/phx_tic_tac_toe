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

  def switch_current_player(game) do 
    flip_flopper = %{"x" => "o", "o" => "x"}
    new_player = flip_flopper[game.current_player]

    #update Game in DB
    game = Ecto.Changeset.change game, current_player: flip_flopper[game.current_player]

    case Repo.update game do 
      {:ok, struct} ->
        struct
      {:error, changeset} -> 
        IO.puts "Something went wrong"
    end
  end
end
