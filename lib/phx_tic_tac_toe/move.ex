defmodule PhxTicTacToe.Move do
  use Ecto.Schema
  import Ecto.Changeset


  schema "moves" do
    field :col, :integer
    field :row, :integer
    field :player, :string
    belongs_to :game, PhxTicTacToe.Game

    timestamps()
  end

  @doc false
  def changeset(move, attrs \\ %{}) do
    move
    |> cast(attrs, [:game_id, :row, :col, :player])
    |> validate_required([:game_id, :row, :col, :player])
  end
end
