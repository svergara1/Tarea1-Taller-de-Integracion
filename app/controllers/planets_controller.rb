require 'httparty'

class PlanetsController < ApplicationController

	include HTTParty
	format :json

	def index
		
	end

  	def show
  		puts params[:id]
  		@planet = HTTParty.get("https://swapi.co/api/planets/#{params[:id]}",
  		:headers =>{'Content-Type' => 'application/json'} )
  		@residents ||= []
  		@planet['residents'].each do |resident|
  			@residents.push(HTTParty.get(resident,
  			:headers =>{'Content-Type' => 'application/json'}))  
  		end
  		@films ||= []
  		@planet['films'].each do |film|
  			@films.push(HTTParty.get(film,
  			:headers =>{'Content-Type' => 'application/json'}))  		
  		end
  	end

end
