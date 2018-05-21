require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = generate_grid(20)
  end

  def score
    letters = params[:letters].split(" ")
    answer = params[:answer].split("")
    grid_hash = Hash.new(0)
    user_hash = Hash.new(0)

    letters.each do |element|
      grid_hash[element] += 1
    end

    answer.each do |element|
      user_hash[element.downcase] += 1
    end

    result = []
    user_hash.each do |key, _value|
      if user_hash[key].to_i <= grid_hash[key].to_i
        state = true
      else
        state = false
      end
      result << state
    end

    if result.include?(false)
      @score = 0
      @message = "#{answer.join} is not in the grid to match"
    elsif check_word(answer.join) == true
      @message = "well done"
    else
      @message = "#{answer.join} is not an english word"
      @score = 0
    end
  end

  def generate_grid(grid_size)
    letters = ("a".."z").to_a
    letters_random = []
    for index in 0..grid_size.to_i - 1
      letters_random[index] = letters.sample(1)
    end
    letters_random.flatten!
  end

  def check_word(answer)
    url = "https://wagon-dictionary.herokuapp.com/#{answer}"
    answer = JSON.parse(open(url).read)
    return answer["found"]
  end

end
