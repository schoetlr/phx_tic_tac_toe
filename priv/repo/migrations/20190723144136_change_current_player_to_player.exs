defmodule PhxTicTacToe.Repo.Migrations.ChangeCurrentPlayerToPlayer do
  use Ecto.Migration

  def change do
    alter table(:moves) do
      remove :current_player
      add :player, :string
    end
  end
end
