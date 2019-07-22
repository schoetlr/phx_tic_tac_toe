defmodule PhxTicTacToe.Move do
  use Ecto.Schema
  import Ecto.Changeset


  schema "moves" do
    field :col, :integer
    field :game_id, :integer
    field :row, :integer

    timestamps()
  end

  @doc false
  def changeset(move, attrs \\ %{}) do
    move
    |> cast(attrs, [:game_id, :row, :col])
    |> validate_required([:game_id, :row, :col])
  end
end
