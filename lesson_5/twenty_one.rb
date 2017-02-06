CARDS = ['2', '3', '4', '5', '6', '7', '8', '9',\
         '10', 'J', 'Q', 'K', 'A'].freeze
SUITS = ['D', 'H', 'C', 'S'].freeze # Diamonds, Hearts, Clubs, Spades

def initialize_deck
  new_deck = []
  CARDS.each do |item|
    SUITS.each do |suit|
      new_deck << Array[suit, item]
    end
  end
  new_deck
end

def prompt(msg)
  puts "=> #{msg}"
end

def add_to_hand(hand_ary, deck)
  new_card = deck.sample
  hand_ary << new_card
  update_deck(new_card, deck)
  hand_ary
end

def update_deck(card, deck)
  deck.delete(card)
end

def deal_first_hand(hand_ary, deck)
  2.times do
    add_to_hand(hand_ary, deck)
  end
  hand_ary
end

def joinand(values, delimiter=', ', word='and')
  if values.size == 2
    values.join(" #{word} ")
  else
    values[-1] = "#{word} #{values.last}"
    values.join(delimiter)
  end
end

def display_full_hand(hand_ary, player)
  card_values = hand_ary.map { |array| array[1] }
  if player == 'Dealer'
    prompt "Dealer has: #{joinand(card_values)}"
  else prompt "You have: #{joinand(card_values)}"
  end
end

def display_dealer_hand(hand_ary)
  prompt "Dealer has: #{hand_ary[0][1]} and unknown card"
end

def player_plays_hand(hand_ary, deck)
  answer = nil
  loop do
    prompt "hit or stay?"
    answer = gets.chomp
    if answer == 'hit'
      add_to_hand(hand_ary, deck)
      break if busted?(hand_ary)
      display_full_hand(hand_ary, 'Player')
    elsif answer == 'stay' || busted?(hand_ary)
      break
    end
  end
end

def dealer_plays_hand(hand_ary, deck)
  loop do
    if card_total(hand_ary) >= 17
      break
    else
      add_to_hand(hand_ary, deck)
      display_full_hand(hand_ary, 'Dealer')
    end
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
    hand_total -= 10 if hand_total > 21
  end
  hand_total
end

def busted?(hand_ary)
  card_total(hand_ary) > 21
end

def clear_screen
  system('clear') || system('cls')
end

def display_winner(hand_ary1, hand_ary2)
  if busted?(hand_ary2)
    prompt "Dealer busts! You win!"
  else
    prompt "You have: #{card_total(hand_ary1)}"
    prompt "Dealer has: #{card_total(hand_ary2)}"
    determine_winner(hand_ary1, hand_ary2)
  end
end

def determine_winner(hand_ary1, hand_ary2)
  if card_total(hand_ary1) > card_total(hand_ary2)
    prompt "You win!"
  elsif card_total(hand_ary2) > card_total(hand_ary1)
    prompt "Dealer wins!"
  else
    prompt "No winner this round."
  end
end

def play_again?
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

prompt "Welcome to 21!"

loop do
  deck = initialize_deck
  player_hand = []
  dealer_hand = []

  deal_first_hand(player_hand, deck)
  display_full_hand(player_hand, 'Player')

  deal_first_hand(dealer_hand, deck)
  display_dealer_hand(dealer_hand)

  player_plays_hand(player_hand, deck)

  if busted?(player_hand)
    display_full_hand(player_hand, 'Player')
    prompt("You bust!")
    break unless play_again?
    clear_screen
    next
  else
    prompt("You chose to stay!")
  end

  display_full_hand(dealer_hand, 'Dealer')
  dealer_plays_hand(dealer_hand, deck)

  display_winner(player_hand, dealer_hand)

  break unless play_again?
  clear_screen
end

prompt "Thank you for playing 21! Goodbye!"
