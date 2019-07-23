defmodule PhxTicTacToe.Repo.Migrations.AddDefaultValueToGames do
  use Ecto.Migration

  def change do
    alter table(:games) do
      modify :current_player, :string, default: "x"
    end
  end
end
