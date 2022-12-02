# nethttp.rb
require 'uri'
require 'net/http'
require 'json'

module ApplicationHelper
  def random_fortune()
    uri = URI("https://fortune.onrender.com/fortune/random")
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body)["fortune"]
  end
end
