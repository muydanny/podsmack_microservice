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

  get '/podcast/find' do
    binding.pry
    podcasts_cleaner = PodcastResultsCleaner.new
  end
end
