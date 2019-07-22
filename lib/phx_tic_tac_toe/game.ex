defmodule PhxTicTacToe.Game do
  use Ecto.Schema
  import Ecto.Changeset


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
end
