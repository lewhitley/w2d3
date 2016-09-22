class Card

  SUIT_STRINGS = {
  :clubs    => "♣",
  :diamonds => "♦",
  :hearts   => "♥",
  :spades   => "♠"
}

  VALUE_STRINGS = {
    :two   => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13,
    :ace   => 14
  }

  def self.get_values
    VALUE_STRINGS.keys
  end

  def self.get_suits
    SUIT_STRINGS.keys
  end

  attr_reader :value, :suit

  def initialize(value, suit)
    Card.get_values.include?(value) ? @value = value : raise(ArgumentError)
    Card.get_suits.include?(suit) ? @suit = suit : raise(ArgumentError)
  end

  def get_value
    VALUE_STRINGS[@value]
  end
end
