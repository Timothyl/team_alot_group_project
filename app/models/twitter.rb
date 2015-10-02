class Twitter < ActiveRecord::Base
  require 'rubygems'
  require 'oauth'
  require 'json'

  $baseurl = "https://api.twitter.com"
  $consumer_key = OAuth::Consumer.new(
      "PS55XVsTBJ6m787x6a2awyckK",
      "UcRMbuMrhTnKdDtZPE24AyqWAHbBj4l5SuDX9aAYr3rXijdYLh"
  )

  $access_token = OAuth::Token.new(
      "58116905-VcZet6CcjgmwVJrRSRbwKua76QZVS5G553FZMfJS0",
      "BdNesCWh5rEWTZeKwObqCUiehCf0ldND3ZzmCol57ZuWA"
  )

  def self.find_tweets(user, since_id)
  	path = "/1.1/statuses/user_timeline.json"
  	options = Hash.new()
  	# options["q"] = "@#{user}"
    options["screen_name"] = "#{user}"
  	options["result_type"] = "recent"
  	options["count"] = "1"
  	if since_id then
  		options["since_id"] = since_id
  	end
  	query = URI.encode_www_form(options)
  	address = URI("#{$baseurl}#{path}?#{query}")

  	request = Net::HTTP::Get.new address.request_uri

  	response = send_request(address, request)
    id = JSON.parse(response.body)[0]['id_str']

    path = "/1.1/statuses/oembed.json"

  	address = URI("#{$baseurl}#{path}?id=#{id}")

  	request = Net::HTTP::Get.new address.request_uri

  	response = send_request(address, request)
    binding.pry
  	return response
  end

  def self.send_request(address, request)
  	http             = Net::HTTP.new address.host, address.port
  	http.use_ssl     = true
  	http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  	request.oauth! http, $consumer_key, $access_token
  	http.start
  	return http.request request
  end
end
