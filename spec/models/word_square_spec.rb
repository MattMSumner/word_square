require 'spec_helper'

describe WordSquare do
  it 'should have an integer above 0 to be valid' do
    @word_square = WordSquare.new(dimension: 1, dictionary: [])
    expect(@word_square.valid?).to be true
    @word_square.dimension = "bell"
    expect(@word_square.valid?).to_not be true
    @word_square.dimension = "0"
    expect(@word_square.valid?).to_not be true
  end

  it 'returns the dimension for the to_param method' do
    @word_square = WordSquare.new(dimension: 1, dictionary: [])
    expect(@word_square.to_param).to eq 1
  end

  it 'returns an empty array if there are no word squares' do
    @word_square = WordSquare.new(dimension: 1, dictionary: [])
    expect(@word_square.find).to eq []
  end

  it 'for dimension 1, given a dictionary with a one letter word, finds a word square' do
    @word_square = WordSquare.new(dimension: 1, dictionary: ["a"])
    expect(@word_square.find).to eq [["a"]]
  end
end
