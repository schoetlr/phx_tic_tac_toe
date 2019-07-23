defmodule PhxTicTacToe.Repo.Migrations.AddReferencesToMoves do
  use Ecto.Migration

  def change do
    alter table(:moves) do
      modify :game_id, references(:games)
    end
  end
end
