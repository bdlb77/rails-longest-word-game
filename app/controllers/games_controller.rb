require 'open-uri'
require 'json'
class GamesController < ApplicationController
  def new
    @letters = 10.times.map{[*'a'..'z'].sample}
  end

  def score
    #first capture word from user
    #built url to see if your exist
    #saved resulting hash into word_check(found, word)
    #check if word found
      #if yes, then check if word build out of grid
    @grid = params[:grid_letters]
    @word = params[:word]
    url =  "https://wagon-dictionary.herokuapp.com/#{@word}"
    file = open(url).read
    word_check = JSON.parse(file)
    @result = word_check["found"]
    @grid.split('')
    @word.split('').each do |l| 
      if @grid.include?(l) && @result == true
        @yay = "#{@word} is real!"
      elsif @grid.include?(l) && @result == false
        @yay = "#{@word} is not a valid word"
      elsif !@grid.include?(l)
        @yay = "#{@word} is not from the grid."
      end
    end
  end
end
