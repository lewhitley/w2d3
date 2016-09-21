require 'rspec'
require 'tdd_practice'

describe "#my_uniq" do
  it "raises error if input is not an array" do
    expect{ my_uniq("hello") }.to raise_error(ArgumentError)
  end

  it "returns an array of the unique elements" do
    expect(my_uniq([1,2,1,3,3])).to eq([1,2,3])
  end
end

describe Array do
  describe "#two_sum" do

    it "returns an array of indices" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
    it "returns array in sorted order" do
      expect([-1, 0, 2, -2, 1].two_sum).to_not eq([[2, 3], [0,4]])
    end
  end
end

describe "#my_transpose" do
  it "returns the transposed array" do
    expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq([[0, 3, 6], [1, 4, 7],[2, 5, 8]])
  end
end

describe "#my_stock_picker" do
  it "makes sure you buy before you sell" do
    expect(my_stock_picker([20, 30, 10, 50, 5])).to_not eq([3,4])
  end

  it "returns the most profitable pair of days" do
    expect(my_stock_picker([20, 30, 10, 50, 5])).to eq([2,3])
  end
end
