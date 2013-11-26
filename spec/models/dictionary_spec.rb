require 'spec_helper'

describe Dictionary do
  it "should return words with a certain length" do
    dictionary = Dictionary.new("english")
    dictionary.words_with_length(4).each do |word|
      expect(word.length).to be 4
    end
  end
end
