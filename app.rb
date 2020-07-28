require 'sinatra'
require 'faraday'
require 'dotenv/load'
require 'pry'
require './services/podcast_results_service.rb'
Dotenv.load

class PodcastMicroService < Sinatra::Base


  get '/podcast/:podcast_id' do 
    podcast_service = PodcastResultsService.new 
    r = podcast_service.podcast(params[:podcast_id])
    require 'pry'; binding.pry
  end


end

