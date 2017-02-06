INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
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
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, punc=', ', conj='or')
  case arr.size
  when 0 then ' '
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{conj} ")
  else
    num_string = " "
    (arr.length - 1).times do |i|
      num_string << arr[i].to_s + punc
    end
    num_string << conj + " #{arr[-1]}"
  end
end

def first_to_play(choice='player')
  if choice == 'choose'
    choose_player
  else choice
  end
end

def choose_player
  prompt "Hello! Welcome to Tic Tac Toe"
  first_up = ' '
  loop do
    prompt "Who is up first: Player or Computer? (Please enter 'p' or 'c')"
    first_up = gets.chomp
    break if first_up.casecmp('p').zero? || first_up.casecmp('c').zero?
    prompt "Sorry, that's not a valid choice."
  end
  if first_up == 'c'
    'computer'
  elsif first_up == 'p'
    'player'
  end
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
  square = get_computer_square(brd, COMPUTER_MARKER)

  if !square
    square = get_computer_square(brd, PLAYER_MARKER)
  end

  if !square
    square = 5 if brd[5] == INITIAL_MARKER
  end

  if !square
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def get_computer_square(brd, marker)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, marker)
    break if square
  end
  square
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

def place_piece!(brd, plyr)
  if plyr == 'player'
    player_places_piece(brd)
  elsif plyr == 'computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(plyr)
  if plyr == 'player'
    'computer'
  elsif plyr == 'computer'
    'player'
  end
end

def display_winner(brd)
  if someone_won?(brd)
    prompt "#{detect_winner(brd)} won!"
  else
    prompt "It's a tie!"
  end
end

def clear_screen
  system('clear') || system('cls')
end

def keep_score(score_hash, brd)
  if detect_winner(brd) == 'Player'
    score_hash['player'] += 1
  elsif detect_winner(brd) == 'Computer'
    score_hash['computer'] += 1
  end
  prompt "The score is #{score_hash['player']} to #{score_hash['computer']}"
  prompt "First one to 5 wins!"
end

def display_final_score(score)
  prompt "Final score: #{score['player']} to #{score['computer']}"
  if score['player'] == 5
    prompt "Player wins!"
  elsif score['computer'] == 5
    prompt "Computer wins!"
  end
end

player1 = 'choose'
score = { 'player' => 0, 'computer' => 0 }

loop do
  board = initialize_board
  current_player = first_to_play(player1)

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    clear_screen
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  display_winner(board)

  keep_score(score, board)

  break if score['player'] == 5 || score['computer'] == 5

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  clear_screen
end

display_final_score(score)
prompt "Thanks for playing Tic Tac Toe! Goodbye!"
