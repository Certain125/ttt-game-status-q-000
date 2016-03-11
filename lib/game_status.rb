

# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6],
  [1,4,7], [2,5,8], [0,4,8], [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |single_win|
    win_index_1 = single_win[0]
    win_index_2 = single_win[1]
    win_index_3 = single_win[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return single_win
    end
  end
end

def full?(board)
  if board.any?{|spot| spot == " " || spot == nil}
    return false
  else
    true
  end
end

def draw?(board) #ask
  if full?(board) == true && won?(board) == false && over?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  else
    false
  end
end

def winner?(board)
  if won?(board) == true && WIN_COMBINATIONS.all?{|x| x == "X"}
    return "X"
  elsif won?(board) == true && WIN_COMBINATIONS.all?{|o| o == "O"}
    return "O"
  else
    return nil
  end
end



