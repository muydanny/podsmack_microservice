require 'dotenv'
require 'faraday'
require 'json'
require 'dotenv'
Dotenv.load

class PodcastResultsService 


  def podcast(podcast_id) 
    get_json("/podcasts/#{podcast_id}")
  end
  
  def conn 
    Faraday.new("https://listen-api.listennotes.com/api/v2") do |faraday|
      faraday.headers['X-ListenAPI-Key'] = ENV["LISTEN_API"]

    end
  end
  
  def get_json(url)
  response = conn.get(url)
    require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end
end