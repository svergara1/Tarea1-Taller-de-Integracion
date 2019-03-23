require 'httparty'

class PersonsController < ApplicationController

	include HTTParty
	format :json

	def index
		
	end

  	def show
  		@person = HTTParty.get("https://swapi.co/api/people/#{params[:id]}",
  		:headers =>{'Content-Type' => 'application/json'} )
  		@planet = HTTParty.get(@person['homeworld'],
  		:headers =>{'Content-Type' => 'application/json'} )
  		@films ||= []
  		@person['films'].each do |film|
  			@films.push(HTTParty.get(film,
  			:headers =>{'Content-Type' => 'application/json'}))  		
  		end

  	end

end
