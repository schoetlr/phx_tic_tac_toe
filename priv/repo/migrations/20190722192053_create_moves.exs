defmodule PhxTicTacToe.Repo.Migrations.CreateMoves do
  use Ecto.Migration

  def change do
    create table(:moves) do
      add :game_id, :integer
      add :row, :integer
      add :col, :integer

      timestamps()
    end

  end
end
