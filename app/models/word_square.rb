class WordSquare
  include ActiveModel::Model

  attr_accessor :dimension, :dictionary

  validates :dimension, numericality: { only_integer: true }, presence: true
  validate :dimension_cannot_be_zero
  validate :dictionary, presence: true

  alias_method :to_param, :dimension

  def find
    @_find ||= find_square
  end

  private

  def dimension_cannot_be_zero
    if dimension.to_i < 1
      errors.add(:dimension, "must be greater then 0")
    end
  end

  def find_square
    square_searcher = SquareSearcher.new(@dimension.to_i, @dictionary)
    square_searcher.words.map do |word|
      word.split.map do |letter|
        letter
      end
    end
  end
end
