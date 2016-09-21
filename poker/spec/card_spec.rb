require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new(:two, :heart) }

  describe "#initialize" do
    it "has a value and suit" do
      expect(card.value).to_not be_nil
      expect(card.suit).to_not be_nil
    end
  end
end
