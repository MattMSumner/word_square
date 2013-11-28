class SquareSearcher

  attr_reader :words

  def initialize(dimension, lexicon)
    @dimension = dimension
    @lexicon = lexicon
    @lexicon_trie = Containers::Trie.new
    @lexicon.each do |word|
      @lexicon_trie.push(word, '')
    end
    @tried = {}
    generate_word_square
  end

  private

  def generate_word_square
    choose_random_starting_word
    while @words.length < @dimension do
      if no_more_starting_words
        break
      elsif available_words.present?
        @words << available_words.sample
      else
        remove_last_word_and_add_to_tried(@words.length)
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
    prefix = @words.map { |word| word[@words.length] }.join('')

    string = prefix + '*' * (@dimension - @words.length)

    pool = @lexicon_trie.wildcard(string)

    if @tried[@words.length + 1]
      pool = pool - @tried[@words.length + 1]
    end

    pool
  end
end
