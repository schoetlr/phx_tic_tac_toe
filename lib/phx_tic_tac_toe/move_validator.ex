defmodule PhxTicTacToe.MoveValidator do

  def valid_move?(row, col, board) do 
    current_pos = board[row][col]

    cond do 
      row > 2 || col > 2 ->
        false
      row < 0 || col < 0 ->
        false
      current_pos != "_" ->
        false
      true -> true
    end
  end
  
end
