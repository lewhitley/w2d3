require_relative 'hand'

class Player
  attr_reader :name, :hand, :pot

  def initialize(name, pot, deck)
    @name = name
    @pot = pot
    @hand = Hand.new(deck).current_hand
  end
end
