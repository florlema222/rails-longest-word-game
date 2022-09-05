require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @random_letters = ('a'..'z').to_a.shuffle.sample(10)
  end

  def score
    @question = params[:question]
    url = "https://wagon-dictionary.herokuapp.com/" + @question.to_s
    user_serialized = URI.open(url).read
    answer = JSON.parse(user_serialized)
    @length = answer["length"]
    puts @length
  end
end
