defmodule PhxTicTacToe.EndGameLogic do

  def game_over?(board) do
    horizontal_win?(board) || vertical_win?(board) || diagonal_win?(board) || board_full?(board)
  end

  def board_full?(board) do 
    Enum.all?(board, fn {k, row} -> 
      Enum.all?(row, fn{k, val} ->
        val == "x" || val == "o"
      end) 
    end)
  end

  def horizontal_win?(board) do 
    Enum.any?(board, fn {k, row} -> 
      Enum.all?(row, fn{_k, val} ->
        val == "x"
      end) || Enum.all?(row, fn {_k, val} ->
        val == "o"
      end) 
    end)
  end

  def vertical_win?(board) do 
    #thought about looping to do this but it got pretty convoluted so stuck to with this ?procedural? solution
    cond do 
      board[0][0] == "x" && board[1][0] == "x" && board[2][0] == "x" ->
        true
      board[0][1] == "x" && board[1][1] == "x" && board[2][1] == "x" ->
        true
      board[0][2] == "x" && board[1][2] == "x" && board[2][2] == "x" ->
        true
      board[0][0] == "o" && board[1][0] == "o" && board[2][0] == "o" ->
        true
      board[0][1] == "o" && board[1][1] == "o" && board[2][1] == "o" ->
        true
      board[0][2] == "o" && board[1][2] == "o" && board[2][2] == "o" ->
        true
      true ->
        false
    end
  end

  def diagonal_win?(board) do 
    cond do 
      board[0][0] == "x" && board[1][1] == "x" && board[2][2] == "x" ->
        true
      board[0][2] == "x" && board[1][1] == "x" && board[2][0] == "x" ->
        true
      board[0][0] == "o" && board[1][1] == "o" && board[2][2] == "o" ->
        true
      board[0][2] == "o" && board[1][1] == "o" && board[2][0] == "o" ->
        true
      true ->
        false
    end
  end
  
end
