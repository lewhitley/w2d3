require 'rspec'
require 'towers'

describe TowersOfHanoi do
  subject(:tower) { TowersOfHanoi.new }

  describe "#initialize" do
    it "makes three stacks" do
      expect(tower.stacks.length).to be(3)
    end

    it "fills the first stack" do
      expect(tower.stacks.first).to eq([3, 2, 1])
    end

  end

  describe "#move" do
    before(:each) do
      tower.move(0, 1)
    end

    it "removes the top disk from the selected stack" do
      expect(tower.stacks.first).to eq([3, 2])
    end

    it "places the selected disk on the new stack" do
      expect(tower.stacks[1]).to eq([1])
    end

    it "does not place larger disk onto smaller disk" do
      tower.move(0,1)
      expect(tower.stacks[1]).to_not eq([1, 2])
    end

    it "raises an error if selected stack is empty" do
      expect {tower.move(2,0)}.to raise_error ("can't select empty stack")
    end

  end

  describe "#won?" do
    let(:winning1) { TowersOfHanoi.new }
    let(:winning2) { TowersOfHanoi.new }
    let(:not_won) { TowersOfHanoi.new }

    before(:each) do
      winning1.stacks = [[], [3, 2, 1], []]
      winning2.stacks = [[], [], [3, 2, 1]]
      not_won.stacks = [[3], [2], [1]]
    end

    it "makes sure that a stack other than first is full" do
      expect(winning1.won?).to be true
      expect(winning2.won?).to be true
    end

    it "makes sure that first stack is empty" do
      expect(not_won.won?).to be false
    end
  end
end
