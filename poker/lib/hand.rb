require_relative 'deck'

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
    return 10 if royal_flush?
    return 9 if straight_flush?
    return 8 if four_of_a_kind?
    return 7 if full_house?
    return 6 if flush?
    return 5 if straight?
    return 4 if three_of_a_kind?
    return 3 if two_pair?
    return 2 if pair?
    1
  end

  def card_suits
    @current_hand.map { |card| card.suit }
  end

  def card_values
    @current_hand.map { |card| card.get_value }.sort
  end

  def royal_flush?
    if flush?
      return true if card_values.sort == [10,11,12,13,14]
    end
    false
  end

  def flush?
    card_suits.all? { |suit| card_suits.first == suit }
  end

  def straight_flush?
    if flush? && straight?
      return true
    end
    false
  end

  def straight?
    card_values.each_with_index do |value, idx|
      return false if card_values[idx+1] - value != 1
      break if idx == (card_values.length - 2)
    end

    true
  end

  def full_house?
    duped = card_values.dup

    if of_a_kind.first == 3
      if card_values.first == of_a_kind.last
        return true if duped.drop(3).first == duped.drop(3).last
      else
        return true if duped.take(3).first == duped.take(3).last
      end
    end

    false
  end

  def four_of_a_kind?
    return true if of_a_kind.first == 4
    false
  end

  def three_of_a_kind?
    return true if of_a_kind.first == 3
    false
  end

  def two_pair?
    pair_count = 0

    card_values.uniq.each do |value|
      pair_count += 1 if card_values.count(value) == 2
      return true if pair_count == 2
    end

    false
  end

  def pair?
    return true if of_a_kind.first == 2
    false
  end

  def of_a_kind(sorted = card_values)
    current_count = 0
    best_count = 0
    best_value = nil

    sorted.each_with_index do |value, idx|
      if idx == 0
        current_count += 1
        best_value = value
      elsif value == sorted[idx-1]
        current_count += 1
        if idx == sorted.length - 1 && current_count > best_count
          best_count, best_value = current_count, sorted[idx-1]
        end
      elsif value != sorted[idx-1]
        if current_count > best_count
          best_count, best_value = current_count, sorted[idx-1]
        end
        current_count = 1
      end
    end
    [best_count, best_value]
  end
end
