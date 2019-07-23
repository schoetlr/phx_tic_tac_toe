defmodule PhxTicTacToe.Repo.Migrations.AddCurrentPlayerToGames do
  use Ecto.Migration

  def change do
    alter table(:games) do
      add :current_player, :string
    end
  end
end
