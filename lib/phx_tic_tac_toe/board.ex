defmodule PhxTicTacToe.Board do
  
  def empty_board do 
    %{0 => %{0 => "_", 1 => "_", 2 => "_"},
      1 => %{0 => "_", 1 => "_", 2 => "_"},
      2 => %{0 => "_", 1 => "_", 2 => "_"}}
  end

  #maybe same problem as below
  #ALSO, probably nothing in moves (query not working)
  def populated_board(moves) do
    board = empty_board

    Enum.each moves, fn move ->
      IO.inspect move
      IO.puts "in the loop"
      board = put_in(board, [move.row, move.col], move.player)
    end

    board
  end

  #bp not available in Enum.each?
  #or enum.each not returning the thing
  #prob use recursion
  def serialize_board(board, row \\ 0, serial_board \\ "") do 
    cond do 
      row <= 2 ->
        serial_board = serial_board <> "#{board[row][0]} #{board[row][1]} #{board[row][2]}\n"
        serialize_board(board, row + 1, serial_board)
      true -> serial_board
    end
  end

  def serialized(moves) do 
    populated_board(moves) |> serialize_board
  end
end
