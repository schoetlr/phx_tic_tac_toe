defmodule PhxTicTacToe.Game do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhxTicTacToe.Repo
  alias PhxTicTacToe.Game
  import Ecto.Query

  schema "games" do
    field :player_one_name, :string
    field :player_two_name, :string
    field :winner, :string

    timestamps()
  end

  @doc false
  def changeset(game, attrs \\ %{}) do
    game
    |> cast(attrs, [:player_one_name, :player_two_name, :winner])
    |> validate_required([:player_one_name, :player_two_name])
  end

  def games do 
    query = from g in Game, 
            select: g.id, g.player_one_name, g.player_two_name,
            order_by: [desc: g.inserted_at]

    Repo.all(query)
  end
end
