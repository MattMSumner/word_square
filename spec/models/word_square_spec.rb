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

  it 'finds should not find a word square if there is not a valid one' do
    @word_square = WordSquare.new(dimension: 2, dictionary: ["no"])
    expect(@word_square.find).to eq []
  end

  it 'finds a 4x4 word square with the rows of words being the same as the columns' do
    @dictionary = Dictionary.new("english").words_with_length(4)
    @word_square = WordSquare.new(dimension: 4, dictionary: @dictionary)
    @word_square.find.each_with_index do |word, word_index|
      word.each_with_index do |letter, letter_index|
        expect(letter).to eq @word_square.find[letter_index][word_index]
      end
    end
  end
end
