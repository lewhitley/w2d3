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
    let(:fh_deck) { double("deck", :take_card =>
      [Card.new(:jack,:hearts), Card.new(:jack,:diamonds),
      Card.new(:six,:hearts), Card.new(:six,:clubs),
      Card.new(:six,:spades)])}
    let(:full_hand) { Hand.new(fh_deck) }

    it "returns full house instead of three of a kind" do
      expect(full_hand.calculate_hand).to eq(7)
    end

    let(:sf_deck) { double("deck", :take_card =>
      [Card.new(:six,:clubs), Card.new(:seven,:clubs),
      Card.new(:eight,:clubs), Card.new(:nine,:clubs),
      Card.new(:ten,:clubs)])}
    let(:sf_hand) { Hand.new(sf_deck) }

    it "returns straight flush instead of high card" do
      expect(sf_hand.calculate_hand).to eq(9)
    end

    let(:three_deck) { double("deck", :take_card =>
      [Card.new(:seven,:diamonds), Card.new(:seven,:clubs),
      Card.new(:seven,:hearts), Card.new(:nine,:clubs),
      Card.new(:ten,:clubs)])}
    let(:three_hand) { Hand.new(three_deck) }

    it "returns three of a kind instead of pair" do
      expect(three_hand.calculate_hand).to eq(4)
    end

    let(:end_deck) { double("deck", :take_card =>
      [Card.new(:six,:diamonds), Card.new(:seven,:clubs),
      Card.new(:eight,:hearts), Card.new(:nine,:clubs),
      Card.new(:nine,:diamonds)])}
    let(:end_hand) { Hand.new(end_deck) }

    it "returns pair" do
      expect(end_hand.calculate_hand).to eq(2)
    end

  end

end
