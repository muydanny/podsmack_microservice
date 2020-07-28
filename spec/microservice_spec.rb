require 'rack/test'
require './app.rb'


RSpec.describe do 
  include Rack::Test::Methods

  def app
    PodcastMicroService.new
  end

  it 'can get a podcast' do 
    get '/podcast/4d3fe717742d4963a85562e9f84d8c79'
    expect(last_response).to be_successful
    
  end

end

