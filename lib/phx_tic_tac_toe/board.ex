defmodule PhxTicTacToe.Board do

  @empty_board %{0 => %{0 => "_", 1 => "_", 2 => "_"},
      1 => %{0 => "_", 1 => "_", 2 => "_"},
      2 => %{0 => "_", 1 => "_", 2 => "_"}}
  
  def empty_board do 
    %{0 => %{0 => "_", 1 => "_", 2 => "_"},
      1 => %{0 => "_", 1 => "_", 2 => "_"},
      2 => %{0 => "_", 1 => "_", 2 => "_"}}
  end

  #maybe same problem as below
  #ALSO, probably nothing in moves (query not working)
  def populated_board(moves, board \\ @empty_board) do
    case moves do 
      [move | tail] -> 
        board = put_in(board, [move.row, move.col], move.player)
        populated_board(tail, board)
      [] ->
        board
      _ ->
        {:error, "This catch all should never happen"}
    end
    
  end

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
