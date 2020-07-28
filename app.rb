require 'sinatra'
require 'faraday'
require 'dotenv/load'
require 'pry'
require './poro/podcast_results_cleaner.rb'
Dotenv.load

class PodcastMicroService < Sinatra::Base


  get '/podcast/:podcast_id' do
    podcast_cleaner = PodcastResultsCleaner.new
    x = podcast_cleaner.get_podcast(params[:podcast_id])
  end
end
