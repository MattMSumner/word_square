class SquareSearcher

  attr_reader :words

  def initialize(dimension, lexicon)
    @dimension = dimension
    @lexicon = lexicon
    @tried = {}
    generate_word_square
  end

  private

  def generate_word_square
    choose_random_starting_word
    i = 1
    while i < @dimension do
      if no_more_starting_words
        break
      elsif available_words.present?
        @words << available_words.sample
        i += 1
      else
        remove_last_word_and_add_to_tried(i)
        i -= 1
      end
    end
  end

  def choose_random_starting_word
    @words = [@lexicon.sample]
    @words = @words.compact
  end

  def no_more_starting_words
    @words.empty? && available_words.empty?
  end

  def remove_last_word_and_add_to_tried(index)
    @tried[index] ||= []
    @tried[index] << @words.pop
  end

  def available_words
    pool = @lexicon
    @words.each_with_index do |word, index|
      pool.delete_if { |word_from_pool| word[index + 1] == word_from_pool[index + 1] }
    end

    if @tried[@words.length + 1]
      pool -= @tried[@words.length + 1]
    end

    pool
  end
end
