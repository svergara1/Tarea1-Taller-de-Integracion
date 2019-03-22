require 'httparty'


class FilmsController < ApplicationController

	include HTTParty
	format :json


	def index
    @films = HTTParty.get("https://swapi.co/api/films",
    :headers =>{'Content-Type' => 'application/json'} )['results']
  end

  	def show
  		@film = HTTParty.get("https://swapi.co/api/films/#{params[:id]}",
  		:headers =>{'Content-Type' => 'application/json'} )
  	end
end
