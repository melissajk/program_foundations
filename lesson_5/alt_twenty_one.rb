CARDS = ['2', '3', '4', '5', '6', '7', '8', '9',\
         '10', 'J', 'Q', 'K', 'A'].freeze
SUITS = ['D', 'H', 'C', 'S'].freeze # Diamonds, Hearts, Clubs, Spades
GAME_NAME = 'Twenty-One'.freeze
TARGET_NUMBER = 21
DLR_THRESHOLD = TARGET_NUMBER - 4
DEALER_HAS = 'Dealer has'
YOU_HAVE = 'You have'

def initialize_deck
  SUITS.product(CARDS).shuffle
end

def prompt(msg)
  puts "=> #{msg}"
end

def deal_first_hand(hand_ary, deck)
  2.times do
    hand_ary << deck.pop
  end
  hand_ary
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards)
  player_total = card_total(player_cards)
  dealer_total = card_total(dealer_cards)

  if player_total > TARGET_NUMBER
    :player_busted
  elsif dealer_total > TARGET_NUMBER
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins this round!"
  when :dealer_busted
    prompt "Dealer busted! You win this round!"
  when :player
    prompt "You win this round!"
  when :dealer
    prompt "Dealer wins this round!"
  when :tie
    prompt "It's a tie!"
  end
end

def join_and(values, delimiter=', ', word='and')
  if values.size == 2
    values.join(" #{word} ")
  else
    values[-1] = "#{word} #{values.last}"
    values.join(delimiter)
  end
end

def display_hand(hand_ary, prefix)
  card_values = hand_ary.map { |array| array[1] }
  prompt("#{prefix}: #{join_and(card_values)}")
end

def display_hand_with_hidden_card(hand_ary)
  display_hand([hand_ary[0], ['?', '?']], DEALER_HAS)
end

def player_plays_hand(player_cards, deck)
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end
    hit_me(player_cards, deck) if player_turn == 'h'
    break if player_turn == 's' || busted?(player_cards)
  end
end

def hit_me(player_cards, deck)
  player_cards << deck.pop
  prompt "You chose to hit!"
  display_hand(player_cards, YOU_HAVE)
  prompt "Your total is now: #{card_total(player_cards)}"
end

def dealer_plays_hand(dealer_cards, deck)
  loop do
    break if busted?(dealer_cards) || card_total(dealer_cards) >= DLR_THRESHOLD
    prompt "Dealer hits!"
    dealer_cards << deck.pop
    display_hand(dealer_cards, DEALER_HAS)
  end
end

def card_total(hand_ary)
  hand_total = 0
  card_values = hand_ary.map { |array| array[1] }
  card_values.each do |value|
    hand_total += if value == 'A'
                    11
                  elsif value.to_i.zero?
                    10
                  else
                    value.to_i
                  end
  end
  card_values.select { |value| value == 'A' }.count.times do
    hand_total -= 10 if hand_total > TARGET_NUMBER
  end
  hand_total
end

def busted?(hand_ary)
  card_total(hand_ary) > TARGET_NUMBER
end

def display_hand_totals(dealer_cards, player_cards)
  puts "==============="
  prompt "Dealer has a total of: #{card_total(dealer_cards)}"
  prompt "Player has a total of: #{card_total(player_cards)}"
  puts "==============="
end

def clear_screen
  system('clear') || system('cls')
end

def play_again?
  puts "--------------"
  answer = ''
  loop do
    prompt "Do you want to play again? (y or n)"
    answer = gets.chomp
    break if %w(y n).include?(answer)
    prompt "I'm sorry. That's an invalid response."
  end
  answer == 'y'
end

def keep_score(dealer_cards, player_cards, score)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player
    score['player'] += 1
  when :dealer_busted
    score['player'] += 1
  when :dealer
    score['dealer'] += 1
  when :player_busted
    score['dealer'] += 1
  end
end

def display_score(score)
  prompt "The score is Player: #{score['player']} Dealer: #{score['dealer']}"
  prompt "First one to five wins!"
end

def display_final_score(score)
  prompt "Final score: Player: #{score['player']} Dealer: #{score['dealer']}"
  if score['player'] == 5
    prompt 'You win!'
  elsif score['dealer'] == 5
    prompt 'Dealer wins!'
  end
end

score = { 'player' => 0, 'dealer' => 0 }
prompt "Welcome to #{GAME_NAME}!"

loop do
  deck = initialize_deck
  player_hand = []
  dealer_hand = []

  deal_first_hand(player_hand, deck)
  display_hand(player_hand, YOU_HAVE)

  deal_first_hand(dealer_hand, deck)
  display_hand_with_hidden_card(dealer_hand)

  player_plays_hand(player_hand, deck)

  if busted?(player_hand)
    display_hand_totals(dealer_hand, player_hand)
    display_result(dealer_hand, player_hand)
    keep_score(dealer_hand, player_hand, score)
    display_score(score)
    break unless play_again?
    clear_screen
    next
  end

  prompt "You chose to stay at #{card_total(player_hand)}!"
  prompt "Dealer turn..."
  display_hand(dealer_hand, DEALER_HAS)
  dealer_plays_hand(dealer_hand, deck)

  if busted?(dealer_hand)
    prompt "Dealer total is now: #{card_total(dealer_hand)}"
    display_hand_totals(dealer_hand, player_hand)
    display_result(dealer_hand, player_hand)
    keep_score(dealer_hand, player_hand, score)
    display_score(score)
    break unless play_again?
    clear_screen
    next
  end

  prompt "Dealer stays at #{card_total(dealer_hand)}"

  display_hand_totals(dealer_hand, player_hand)
  display_result(dealer_hand, player_hand)
  keep_score(dealer_hand, player_hand, score)
  display_score(score)

  break if score['player'] == 5 || score['dealer'] == 5
  break unless play_again?
  clear_screen
end

display_final_score(score)
prompt "Thank you for playing #{GAME_NAME}! Goodbye!"
