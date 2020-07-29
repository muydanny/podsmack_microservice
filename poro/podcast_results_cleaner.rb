require './services/podcast_results_service.rb'

class PodcastResultsCleaner

  def initialize
    @podcast_service = PodcastResultsService.new
  end

  def get_podcast(podcast_id)
    json_response = @podcast_service.podcast(podcast_id)
    formatted_podcast = format_podcast_details(json_response)
  end

  def get_search_results(podcast_name)
    json_response = @podcast_service.search_results(podcast_name)
    search_results = format_search_results(json_response[:results])
    {
      data:
            {
              results: search_results
              }
      }
  end

  def format_search_results(search_results)
    search_results.map do |result|
      {
        title: result[:title_original],
        description: result[:description_original],
        thumbnail: result[:thumbnail],
        id: result[:id],
       }
    end
  end


  def format_podcast_details(podcast)
    episode_details = format_episodes_details(podcast[:episodes])
    {
      data:
            {
              title: podcast[:title],
              description: podcast[:description],
              explicit_content: podcast[:explicit_content],
              thumbnail: podcast[:thumbnail],
              episodes: episode_details
              }
      }
  end

  def format_episodes_details(episodes)
    episodes.map do |episode|
      {
        title: episode[:title],
        description: episode[:description],
        audio: episode[:audio],
        audio_length_sec: episode[:audio_length_sec],
        pub_date: Time.at(episode[:pub_date_ms]/1000).strftime('%A, %m/%d/%Y')
       }
    end
  end

end
