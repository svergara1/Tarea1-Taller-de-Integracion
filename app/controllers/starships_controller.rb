require 'httparty'

class StarshipsController < ApplicationController

	include HTTParty
	format :json

	def index
		
	end

  	def show
  		@starship = HTTParty.get("https://swapi.co/api/starships/#{params[:id]}",
  		:headers =>{'Content-Type' => 'application/json'} )
  		@films ||= []
  		@starship['films'].each do |film|
  			@films.push(HTTParty.get(film,
  			:headers =>{'Content-Type' => 'application/json'}))  		
  		end
  		@pilots ||= []
  		@starship['pilots'].each do |pilot|
  			@pilots.push(HTTParty.get(pilot,
  			:headers =>{'Content-Type' => 'application/json'}))  
  		end
  	end
end
