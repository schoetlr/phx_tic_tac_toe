defmodule PhxTicTacToe.MoveValidator do

  def valid_move?(move) do
    inbounds?(move) && !exists?(move)
  end

  def inbounds?(move) do 

  end

  def exists?(move) do 
    #TODO: check the DB to see if a move with the same game_id, row, and col exists.  If one does then the move is not valid.
  end
  
end
