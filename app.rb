require 'sinatra'
require 'faraday'
require 'dotenv/load'
require 'pry'
require './poro/podcast_results_cleaner.rb'
require 'json'
Dotenv.load

class PodcastMicroService < Sinatra::Base


  get '/podcast/:podcast_id' do
    podcast_cleaner = PodcastResultsCleaner.new
    JSON podcast_cleaner.get_podcast(params[:podcast_id])
  end

  get '/search' do
    podcast_name = params[:podcast_name]
    podcasts_cleaner = PodcastResultsCleaner.new
    JSON podcasts_cleaner.get_search_results(podcast_name)
  end
end
