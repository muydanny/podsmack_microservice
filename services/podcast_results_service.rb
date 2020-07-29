require 'dotenv'
require 'faraday'
require 'json'
require 'dotenv'
Dotenv.load

class PodcastResultsService

  def search_results(search_param)
    get_json("/search?q=#{search_param}&type=podcasts&only_in=title")
  end

  def podcast(podcast_id)
    get_json("/podcasts/#{podcast_id}")
  end

  def conn(url)
    Faraday.new("https://listen-api.listennotes.com/api/v2#{url}") do |faraday|
      faraday.headers['X-ListenAPI-Key'] = ENV["LISTEN_API"]
    end
  end

  def get_json(url)
    response = conn(url).get
    JSON.parse(response.body, symbolize_names: true)
  end
end
