defmodule PhxTicTacToe.Repo.Migrations.AddPlayerToMove do
  use Ecto.Migration

  def change do
    alter table(:moves) do
      add :current_player, :string
    end
  end
end
