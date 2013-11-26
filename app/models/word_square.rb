class WordSquare
  include ActiveModel::Model

  attr_accessor :dimension, :dictionary

  validates :dimension, numericality: { only_integer: true }, presence: true
  validate :dimension_cannot_be_zero
  validate :dictionary, presence: true

  alias_method :to_param, :dimension

  def find
    @_find ||= if @dictionary.empty?
      []
    else
      find_square
    end
  end

  private

  def dimension_cannot_be_zero
    if dimension.to_i < 1
      errors.add(:dimension, "must be greater then 0")
    end
  end

  def find_square
    dimension.times.map do |x|
      word = @dictionary.sample
      dimension.times.map do |y|
        word[y]
      end
    end
  end
end
