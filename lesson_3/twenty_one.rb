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
# for display: some kind each iterator? WHere for each card in hand, concatanate another string? use index to increment hand
def display_hands(dealer_hand, player_hand)
  system 'clear'
  puts "DEALER : #{dealer_hand[0][0] + SUITS_SYMBOLS[dealer_hand[0][1]]} | UNKNOWN"
  puts "YOU    : #{player_hand[0][0] + SUITS_SYMBOLS[player_hand[0][1]]} | #{player_hand[1][0] + SUITS_SYMBOLS[player_hand[1][1]]}" 
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
