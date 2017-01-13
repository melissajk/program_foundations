divider = "------------------------------------------------------------------"
VALID_CHOICES = %w(rock paper scissors lizard Spock)
player_score = 0
computer_score = 0

def prompt(message)
  Kernel.puts("=> #{message}")
end

def letter_to_word(choice)
  case choice
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    'scissors'
  when 'l'
    'lizard'
  when 'S'
    'Spock'
  end
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'Spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'Spock' || second == 'paper')) ||
    (first == 'Spock' && (second == 'rock' || second == 'scissors'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    puts divider
    prompt("Choose one: (r)rock, (s)scissors, (p)paper, (l)lizard, (S)Spock")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(choice)
      break
    elsif %w(r p s l S).include?(choice)
      choice = letter_to_word(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  else
    prompt("No winners this round!")
  end

  break if player_score == 5 || computer_score == 5

  prompt("Current score #{player_score} to #{computer_score}.")
  prompt("First one to five wins! Do you want to continue?")
  break unless Kernel.gets().chomp().start_with?('y')
end

puts divider
prompt("Final Score: #{player_score} to #{computer_score}")

if player_score > computer_score
  prompt('You won!')
else
  prompt('Computer won!')
end

prompt("Thank you for playing. Good bye!")
