require 'spec_helper'

describe Dictionary do
  it "should return words with a certain length" do
    dictionary = Dictionary.new("english")
    expect(dictionary.words_with_length('4').length).to_not eq 0
    dictionary.words_with_length('4').each do |word|
      expect(word.length).to be 4
    end
  end
end
