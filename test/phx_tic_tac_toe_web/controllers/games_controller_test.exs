defmodule PhxTicTacToeWeb.GameControllerTest do
  use PhxTicTacToeWeb.ConnCase

  @valid_attrs %{player_one_name: "Sweeney", player_two_name: "Todd", current_player: "x"}
  @invalid_attrs %{}

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Game index"
  end

  test "lists all the games on the index", %{conn: conn} do 
    game = insert_game(%{})
    game_two = insert_game(%{player_one_name: "Foo", player_two_name: "Bar"})

    conn = get conn, game_path(conn, :index)
    #assert html_response(conn, 200) =~ "Game index"

    assert String.contains?(conn.resp_body, "#{game.player_one_name} #{game.player_two_name}")
    assert String.contains?(conn.resp_body, "#{game.player_one_name} #{game.player_two_name}")
  end

  test "creates a game and redirects", %{conn: conn} do 
    conn = post conn, game_path(conn, :create), game: @valid_attrs
    require IEx; IEx.pry
    assert redirected_to(conn) =~ "/games/"
    assert !!Repo.get_by!(PhxTicTacToe.Game, @valid_attrs)
  end
end