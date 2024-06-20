require 'byebug'
RANK = ['1','2','3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
SUITS = ['H', 'D', 'C', 'S']
SUITS_SYMBOLS = {'H' => "♥",'D' => "♦", 'C' => "♣", 'S' => "♠"}
OPENING_CARDS = 2
HIT_CARD = 1

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
  OPENING_CARDS.times do |num|
    hand << hit!(deck)
  end
  hand
end

def hit!(deck)
  card = deck.sample
  deck.delete(card)
  card
end
# for display: some kind each iterator? WHere for each card in hand, concatanate another string? use index to increment hand; maybe use String#center to get spacing righ with 10?
def display_dealer_hand(hand)
  dealer_hand = "DEALER : "
  hand.each_with_index do |card, index|
    dealer_hand << "#{card[0] + SUITS_SYMBOLS[card[1]]} | " unless index == hand.size - 1
  end
  dealer_hand << "UNKNOWN"
  puts dealer_hand
end

def display_player_hand(hand)
  player_hand = "YOU    : "
  hand.each_with_index do |card, index|
    player_hand << "#{card[0] + SUITS_SYMBOLS[card[1]]}"
    player_hand << " | " unless index == hand.size - 1
  end
  puts player_hand
end

def display_hands(dealer_hand, player_hand)
  system 'clear'
  display_dealer_hand(dealer_hand)
  display_player_hand(player_hand)
end

loop do
  #byebug
  deck = initialize_deck
  player_hand = deal_cards!(deck)
  dealer_hand = deal_cards!(deck)
  display_hands(dealer_hand, player_hand)
  loop do
    prompt "Hit or stay?"
    break
  end
  break
end
