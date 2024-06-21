RANK = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
SUITS = ['H', 'D', 'C', 'S']
SUITS_SYMBOLS = { 'H' => "♥", 'D' => "♦", 'C' => "♣", 'S' => "♠" }
FACE_CARD_VALUE = 10
ACE_HIGH = 11
ACE_LOW = 1
OPENING_CARDS = 2
HIT_CARD = 1
TARGET = 21
DEALER_HIT_COUNT = 17

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  new_deck = []
  SUITS.each do |suit|
    RANK.each { |rank| new_deck << [rank, suit] }
  end
  new_deck
end

def deal_cards!(deck)
  hand = []
  OPENING_CARDS.times do |_|
    hand << hit!(deck)
  end
  hand
end

def hit!(deck)
  card = deck.sample
  deck.delete(card)
  card
end

def display_dealer_hand(hand)
  dealer_hand = "DEALER : "
  hand.each_with_index do |card, index|
    unless index == hand.size - 1
      dealer_hand << "#{card[0] + SUITS_SYMBOLS[card[1]]} | "
    end
  end
  dealer_hand << "UNKNOWN"
  puts dealer_hand
end

def display_player_hand(hand)
  player_hand = "YOU    : "
  hand.each_with_index do |card, index|
    player_hand << (card[0] + SUITS_SYMBOLS[card[1]])
    player_hand << " | " unless index == hand.size - 1
  end
  puts player_hand
end

def display_hands(dealer_hand, player_hand)
  system 'clear'
  display_dealer_hand(dealer_hand)
  display_player_hand(player_hand)
end

def add_ace_value(total_value, aces)
  return total_value if aces == 0
  value = total_value
  aces.times do |_|
    value += if (value + (ACE_HIGH + ((aces - 1) * ACE_LOW))) > TARGET
               ACE_LOW
             else
               ACE_HIGH
             end
  end

  value
end

def total(hand)
  total_value = 0
  number_aces = 0
  hand.each do |card|
    if card[0].to_i.to_s == card[0]
      total_value += card[0].to_i
    elsif card[0] == 'A'
      number_aces += 1
    else
      total_value += FACE_CARD_VALUE
    end
  end

  add_ace_value(total_value, number_aces)
end

def bust?(total_value)
  total_value > TARGET
end

def display_results(dealer_hand, player_hand)
  if total(dealer_hand) > total(player_hand)
    prompt "DEALER WON: #{total(dealer_hand)}-#{total(player_hand)}"
  elsif total(dealer_hand) < total(player_hand)
    prompt "YOU WON: #{total(player_hand)}-#{total(dealer_hand)}"
  else
    prompt "YOU TIED`: #{total(dealer_hand)}-#{total(player_hand)}"
  end
end

def player_turn(deck, dealer_hand, player_hand)
  loop do
    prompt "Hit or stay? (h/s)"
    answer = gets.chomp
    player_hand << hit!(deck) if answer.start_with?('h')
    display_hands(dealer_hand, player_hand)
    break if bust?(total(player_hand)) || answer.start_with?('s')
  end
end

def dealer_turn(deck, dealer_hand, player_hand)
  loop do
    break if total(dealer_hand) >= DEALER_HIT_COUNT
    dealer_hand.prepend(hit!(deck))
    display_hands(dealer_hand, player_hand)
  end
end

loop do
  deck = initialize_deck
  player_hand = deal_cards!(deck)
  dealer_hand = deal_cards!(deck)
  display_hands(dealer_hand, player_hand)

  player_turn(deck, dealer_hand, player_hand)

  if bust?(total(player_hand))
    prompt "DEALER WON. YOU BUSTED WITH #{total(player_hand)}"
  else
    prompt "You stayed!"
    dealer_turn(deck, dealer_hand, player_hand)
  end

  if bust?(total(dealer_hand))
    prompt "YOU WON. THE DEALER BUSTED WITH #{total(dealer_hand)}"
  elsif !bust?(total(player_hand))
    display_results(dealer_hand, player_hand)
  end

  prompt "Do you want to play again? (y/n)"
  break unless gets.chomp == 'y'
end

prompt "Thanks for playing Twenty-One!"
