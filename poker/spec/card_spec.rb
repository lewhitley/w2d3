require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new(:two, :hearts) }
  let(:bad_card) { Card.new(:twelve, :yellow) }

  describe "#initialize" do
    it "has a value and suit" do
      expect(card.value).to_not be_nil
      expect(card.suit).to_not be_nil
    end

    it "correctly assigns the value and suit" do
      expect(card.value).to eq(:two)
      expect(card.suit).to eq(:hearts)
    end

    it "does not assign invalid values and suits" do
      expect{ bad_card.value }.to raise_error (ArgumentError)
      expect{ bad_card.suit }.to raise_error (ArgumentError)
    end
  end
end
