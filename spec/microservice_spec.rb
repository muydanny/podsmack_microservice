RSpec.describe do 
  it 'can get a podcast' do 
    get '/podcast/8ba76cb53bd949fb9e1defae4091e412'

    expect(response).to be_successful
    
  end

end

