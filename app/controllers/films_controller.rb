require 'httparty'

class FilmsController < ApplicationController

	include HTTParty
	format :json


	def index
    @films = HTTParty.get("https://swapi.co/api/films",
    :headers =>{'Content-Type' => 'application/json'} )['results']
  end

  	def show
  		dictionary = { "1" => "4", "2" => "5", "3" => "6", "4" => "1", "5" => "2", "6" => "3", "7" => "7", "8" => "8", "9" => "9" }
  		puts dictionary[params[:id]]
  		@film = HTTParty.get("https://swapi.co/api/films/#{dictionary[params[:id]]}",
  		:headers =>{'Content-Type' => 'application/json'})
  		@characters ||= []
  		@film['characters'].each do |character|
  			@characters.push(HTTParty.get(character,
  			:headers =>{'Content-Type' => 'application/json'}))  		
  		end
  		@planets ||= []
  		@film['planets'].each do |planet|
  			@planets.push(HTTParty.get(planet,
  			:headers =>{'Content-Type' => 'application/json'}))  		
  		end
  		@starships ||= []
  		@film['starships'].each do |starship|
  			@starships.push(HTTParty.get(starship,
  			:headers =>{'Content-Type' => 'application/json'}))  		
  		end
  	end
end
