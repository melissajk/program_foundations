INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  puts "You're an #{PLAYER_MARKER}. Computer is an #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "   #{brd[1]} |  #{brd[2]}  |  #{brd[3]} "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "   #{brd[4]} |  #{brd[5]}  |  #{brd[6]} "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "   #{brd[7]} |  #{brd[8]}  |  #{brd[9]} "
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece(brd)
  square = ' '
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = ' '
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line,brd, COMPUTER_MARKER)
    break if square
  end
  
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line,brd,PLAYER_MARKER)
      break if square
    end
  end
  
  if !square
    if brd[5] == INITIAL_MARKER
      square = 5
    end
  end
  
  if !square 
    square = empty_squares(brd).sample
  end
  
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(arr, punc=', ', conj='or')
  case arr.size
  when 0 then ' '
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{conj} ")
  else
    num_string = " "
    (arr.length - 1).times do |i|
      num_string <<  "#{arr[i]}" + punc
    end
  num_string << conj + " #{arr[-1]}"
  end
end

def find_at_risk_square(line,board,marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

player_1 = 'choose'
player_score = 0
computer_score = 0 
loop do
  board = initialize_board
  
  if player_1 == 'choose'
    prompt "Hello! Welcomoe to Tic Tac Toe"
    loop do
      prompt 'Who is going first? (Player or Computer)'
      player_1 = gets.chomp
      break if player_1.downcase == 'player' || player_1.downcase == 'computer'
      prompt "Sorry, that's not a valid choice."
    end
  end
    
  if player_1 == 'computer'.downcase
    
    loop do
      computer_places_piece!(board)
      display_board(board)
      break if someone_won?(board) || board_full?(board)
    
      player_places_piece(board)
      break if someone_won?(board) || board_full?(board)
    end
    
  elsif player_1 == 'player'.downcase
  
    loop do 
      display_board(board)
      player_places_piece(board)
      break if someone_won?(board) ||  board_full?(board)
      
      computer_places_piece!(board)
      break if someone_won?(board) ||  board_full?(board)
    end
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end
  
  if detect_winner(board) == 'Player'
    player_score += 1
  elsif detect_winner(board) == 'Computer'
    computer_score += 1
  end
  
  prompt "The score is #{player_score} to #{computer_score}"
  prompt "First one to 5 wins!"
  break if player_score == 5 || computer_score == 5

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Final score: #{player_score} to #{computer_score}"

if player_score == 5
  prompt "Player wins!"
elsif computer_score == 5
  prompt "Computer wins!"
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
