require 'sinatra'
require 'faraday'
require 'dotenv/load'
require 'pry'

get '/podcast' do 
  r = get_json("/podcasts/:podcast_id")
  require 'pry'; binding.pry
end


def conn 
  Faraday.new("https://www.listennotes.com/api/v2") do |faraday|
    faraday.params['X-ListenAPI-Key'] = ENV["LISTEN_API"]
  end
end

def get_json(url)
  response = conn.get(url)
  JSON.parse(response.body, symbolize_names: true)
end