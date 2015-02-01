require 'json'
require 'simple_oauth'
require 'excon'
require_relative 'lib/twitter_creds'


authorization_header = SimpleOAuth::Header.new("get",
                                               "https://api.twitter.com/1.1/statuses/user_timeline.json",
                                               { :screen_name => "justinbeiber" },
                                               { :consumer_key => API_KEY,
                                                 :consumer_secret => API_SECRET })

response = Excon.send("get", "https://api.twitter.com/1.1/statuses/user_timeline.json", {
  :query => { :screen_name => "justinbeiber" },
  :headers => { "Authorization" => authorization_header.to_s }
})

beibs_tweets = JSON.parse(response.body)
puts beibs_tweets.first