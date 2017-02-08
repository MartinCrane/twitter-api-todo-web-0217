require 'twitter'
require 'yaml'
require "pry"

class TwitterApi
  attr_reader :client

  def initialize
    keys = YAML.load_file('application.yml')
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = keys['CONSUMER_KEY']
      config.consumer_secret     = keys['CONSUMER_SECRET']
      config.access_token        = keys['ACCESS_TOKEN']
      config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
    end
  end


  def most_recent_friend
    # self.client.friends.attrs[:users][0]
    @client.friends.first
    #find the twitter gem method that retrieves a user's friends and grab the most recent friend
  end

  def find_user_for(username)
    @client.user(username)
    #find the twitter gem method that returns the correct user, given a username
  end

  def find_followers_for(username)
    
    # x = @client.followers(username).to_h

    # puts x

    # self.client.followers(username).attrs[:users][0,10]

    self.client.followers(username).take(10)

    # followers = followers.map do |person|
    #    @client.user(person[:screen_name])
    # end

    # followers
    #find the twitter gem method that returns the follows of a given user
 
  end

  def homepage_timeline
    @client.home_timeline
    #find the twitter gem method that retreives the tweets from a user's timeline.
  end
 
end


# puts m.find_followers_for("sm_debenedetto")
# m.client.followers("sm_debenedetto")
# #Bonus: 

# uncomment out the following and read the bonus instructions.
# remember to comment out the WebMock line of your spec_helper, as the instructions dictate.

# tweet_client = TwitterApi.new
# puts tweet_client.most_recent_friend
# puts tweet_client.find_user_for("USERNAME HERE")
# puts tweet_client.find_followers_for("USERNAME HERE")
# puts tweet_client.homepage_timeline
