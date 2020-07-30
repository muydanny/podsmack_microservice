require 'rack/test'
require './app.rb'
require 'json'


RSpec.describe do
  include Rack::Test::Methods

  def app
    PodcastMicroService.new
  end

  it 'can get a podcast' do
    get '/podcast/4d3fe717742d4963a85562e9f84d8c79'
    expect(last_response).to be_successful
    podcast = JSON.parse(last_response.body, symbolize_names: true)
    expect(podcast[:data][:title]).to eq("Star Wars 7x7: The Daily Star Wars Podcast")
    expect(podcast[:data][:explicit_content]).to eq(false)
    expect(podcast[:data][:episodes].length).to eq(10)
  end

  it 'can search for a podcast' do
    get '/search?podcast_name=conan'
    expect(last_response).to be_successful
    results = JSON.parse(last_response.body, symbolize_names: true)
    expect(results[:data][:results]).to_not be_empty
    expect(results[:data][:results].length).to eq(10)
    expect(results[:data][:results][0][:title]).to eq('Conan O’Brien Needs A Friend')
  end
end
