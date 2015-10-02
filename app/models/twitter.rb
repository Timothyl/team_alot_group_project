class Twitter < ActiveRecord::Base
  require 'rubygems'
  require 'oauth'
  require 'json'

  $baseurl = "https://api.twitter.com"
  $consumer_key = OAuth::Consumer.new(
    ENV["TWITTER_CONSUMER_KEY"],
    ENV["TWITTER_SECRET_KEY"]
  )
  $access_token = OAuth::Token.new(
    ENV["TWITTER_ACCESS_TOKEN"],
    ENV["TWITTER_SECRET_TOKEN"]
  )

  def self.find_tweets(user, since_id)
    path = "/1.1/statuses/user_timeline.json"
    options = Hash.new
    options["screen_name"] = "#{user}"
    options["result_type"] = "recent"
    options["count"] = "1"
    if since_id
      options["since_id"] = since_id
    end
    query = URI.encode_www_form(options)
    address_params = "&include_rts=false&exclude_replies=true"
    address = URI("#{$baseurl}#{path}?#{query}#{address_params}")

    request = Net::HTTP::Get.new address.request_uri

    response = send_request(address, request)
    id = JSON.parse(response.body)[0]['id_str']

    path = "/1.1/statuses/oembed.json"

    params = "&align=center&hide_media=true&hide_thread=true&theme=dark"
    address = URI("#{$baseurl}#{path}?id=#{id}#{params}")

    request = Net::HTTP::Get.new address.request_uri

    response = send_request(address, request)
    JSON.parse(response.body)
  end

  def self.send_request(address, request)
    http = Net::HTTP.new address.host, address.port
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request.oauth! http, $consumer_key, $access_token
    http.start
    http.request request
  end
end
