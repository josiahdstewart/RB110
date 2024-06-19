require 'byebug'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMP_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd, cmp_scr, ply_scr)
  byebug
  system 'clear'
  puts "First player to 5 wins!"
  puts "Computer Score: #{cmp_scr} Player Score: #{ply_scr}"
  puts "You're an #{PLAYER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  # offense
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMP_MARKER)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # pick number 5
  if  !square
    square = 5
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMP_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMP_MARKER &&
          brd[line[1]] == COMP_MARKER &&
          brd[line[2]] == COMP_MARKER
      return 'Computer'
    end
  end
  nil
end

def joinor(arr, delimiter=', ', conj='or')
  if arr.size == 2
    "#{arr.first} " + conj + " #{arr.last}"
  elsif arr.size < 2
    arr.first.to_s
  else
    last = arr.pop
    arr.join(delimiter) + delimiter + conj + " #{last}"
  end
end

computer_score = 0
player_score = 0

loop do
  prompt "Would you like to for 1st or 2nd? (Enter 1 or 2)"
  player_order = gets.chomp

  board = initialize_board
  display_board(board, computer_score, player_score)
  byebug

  if player_order == '2'
    loop do
      display_board(board, computer_score, player_score)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end
  else
    loop do
      display_board(board, computer_score, player_score)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end
  end

  display_board(board, computer_score, player_score)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won a point!"
    if detect_winner(board).start_with?('P')
      player_score += 1
    else
      computer_score += 1
    end

  else
    prompt "It's a tie!"
  end

  break if computer_score == 5 || player_score == 5
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt player_score > computer_score ? "Congrats, you won!" : "You lost :("
prompt "Final Score: #{computer_score}-#{player_score}"
prompt "Thanks for playing Tic Tac Toe! Good bye!"
