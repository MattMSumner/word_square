class WordSquaresController < ApplicationController
  def new
    @word_square = WordSquare.new
  end

  def create
    redirect_to word_square_path(params[:word_square][:dimension])
  end

  def show
    @dimension = params[:id]
    @words = Dictionary.new("english").words_with_length(@dimension)
    @word_square = WordSquare.new(dimension: @dimension, dictionary: @words)
  end
end
