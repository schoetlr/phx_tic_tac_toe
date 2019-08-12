defmodule PhxTicTacToe.TestHelpers do 
  alias PhxTicTacToe.{Repo, Game}

  def insert_game(attrs \\ %{}) do 
    changes = Dict.merge(%{
      player_one_name: "Sweeney",
      player_two_name: "Todd",
      current_player: "x"
      }, attrs)

    %Game{} 
    |> Game.changeset(changes)
    |> Repo.insert!()
  end

  def insert_move(game, attrs \\ %{}) do
    game 
    |> Ecto.build_assoc(:moves, attrs)
    |> Repo.insert()
  end

end