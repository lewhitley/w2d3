require 'deck'

class Hand
  HAND_RANKING = {
    royal_flush: 10,
    straight_flush: 9,
    four_of_a_kind: 8,
    full_house: 7,
    flush: 6,
    straight: 5,
    three_of_a_kind: 4,
    two_pair: 3,
    pair: 2,
    high_card: 1
  }

  def self.get_rank
    HAND_RANKING.keys
  end

  def self.get_hand_value
    HAND_RANKING.values
  end

  attr_reader :current_hand

  def initialize(deck)
    @deck = deck
    @current_hand = deck.take_card(5)
  end

  def calculate_hand

  end
end
