require_relative 'card'

class Deck
  attr_reader :cards
  
  def initialize
    @cards = []
    make_cards
  end

  def make_cards
    Card.get_values.each do |value|
      Card.get_suits.each do |suit|
        @cards << Card.new(value, suit)
      end
    end
  end
end
