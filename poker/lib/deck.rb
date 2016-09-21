require 'byebug'
require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    make_cards
  end

  def shuffle
    @cards.shuffle!
  end

  def take_card(n = 1)
    dealt = []
    n.times do
      dealt << @cards.pop
    end
    dealt
  end

  private
  def make_cards
    Card.get_values.each do |value|
      Card.get_suits.each do |suit|
        @cards << Card.new(value, suit)
      end
    end
  end
end
#
# deck = Deck.new
# deck.take_card
# deck.cards.length
