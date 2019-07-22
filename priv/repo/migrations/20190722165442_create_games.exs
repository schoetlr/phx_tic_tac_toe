defmodule PhxTicTacToe.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :player_one_name, :string
      add :player_two_name, :string
      add :winner, :string

      timestamps()
    end

  end
end
