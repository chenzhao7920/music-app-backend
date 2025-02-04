require 'net/http'
require 'json'
class DiscogsService
  BASE_URL = 'https://api.discogs.com'
  def initialize
    @headers = {
      'Authorization' => "Discogs key=#{ENV['DISCOGS_API_KEY']}, secret=#{ENV['DISCOGS_API_SECRET']}",
      'Content-Type' => 'application/json'
    }
  end

  def search(query)
    Rails.logger.info "#{URI.encode_www_form_component(query)}"
    make_request("/database/search?q=#{URI.encode_www_form_component(query)}&type=release")
  end

  def get_artist_releases(artist_id)
    make_request("/artists/#{artist_id}/releases")
  end

  def get_release(release_id)
    make_request("/releases/#{release_id}")
  end

  def get_master(master_id)
    make_request("/masters/#{master_id}")
  end

  def make_request(endpoint)
    uri = URI("#{BASE_URL}#{endpoint}")
    request = Net::HTTP::Get.new(uri)
    @headers.each { |key, value| request[key] = value }

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    JSON.parse(response.body)
  rescue JSON::ParserError => e
    { error: 'Failed to parse response' }
  rescue StandardError => e
    { error: e.message }
  end
end