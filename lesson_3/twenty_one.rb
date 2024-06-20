require 'byebug'
CARDS = ['1','2','3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
SUITS = ['H', 'D', 'C', 'S']
OPENING_CARDS = 2
HIT_CARD = 1

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  new_deck = []
  SUITS.each do |suit|
    CARDS.each { |card| new_deck << [suit, card] }
  end
  new_deck
end

def deal_cards!(deck)
  hand = []
  OPENING_CARDS.times do |num|
    hand << hit(deck)
  end
  hand
end

def hit!(deck)
  card = deck.sample
  deck.delete(card)
  card
end

loop do
  byebug
  deck = initialize_deck
  player_hand = deal_cards!(deck)
  dealer_hand = deal_cards!(deck)
  break
end
