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
    loop_to_find_words
  end

  def choose_random_starting_word
    @words = [@lexicon.sample]
    @words = @words.compact
  end

  def loop_to_find_words
    while @words.length < @dimension do
      if no_more_starting_words
        break
      else
        find_a_word
      end
    end
  end

  def no_more_starting_words
    @words.empty? && available_words.empty?
  end

  def find_a_word
    if available_words.present?
      add_word
    else
      remove_last_word_and_add_to_tried(@words.length)
    end
  end

  def available_words(word_number = @words.length)
    if @tried[word_number + 1]
      pool(word_number) - @tried[word_number + 1]
    else
      pool(word_number)
    end
  end

  def pool(integer)
    @lexicon_trie.wildcard(string(integer))
  end

  def string(integer)
    prefix(integer) + '*' * (@dimension - integer)
  end

  def prefix(integer)
    @words.map { |word| word[integer] }.join('')
  end

  def add_word
    @words << available_words.sample
  end

  def remove_last_word_and_add_to_tried(index)
    @tried[index] ||= []
    @tried[index] << @words.pop
  end
end
