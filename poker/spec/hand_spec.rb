require 'hand'
require 'rspec'

describe Hand do
  subject(:hand) { Hand.new(Deck.new) }

  describe "#initialize" do
    it "gets a hand of five cards" do
      expect(hand.current_hand.length).to be(5)
    end
  end

  describe "#calculate_hand" do
    let(:fh_deck) { double("fh_deck", :take_card =>
      [Card.new(:jack,:hearts), Card.new(:jack,:diamonds),
      Card.new(:jack,:clubs), Card.new(:six,:clubs),
      Card.new(:six,:spades)])}
    let(:full_hand) { Hand.new(fh_deck) }

    it "returns full house instead of three of a kind" do
      expect(full_hand.calculate_hand).to eq(:full_house)
    end

    let(:s_deck) { double("s_deck", :take_card =>
      [Card.new(:six,:hearts), Card.new(:seven,:diamonds),
      Card.new(:eight,:clubs), Card.new(:nine,:clubs),
      Card.new(:ten,:spades)])}
    let(:straight_hand) { Hand.new(s_deck) }

    it "returns straight instead of high card" do
      expect(straight_hand.calculate_hand).to eq(:straight)
    end
  end

end
