## This is a very simple working example of a bot you can build with
## chatterbot. It looks for mentions of '@echoes_bot' (the twitter
## handle the bot uses), and sends replies with the name switched to
## the handle of the sending user

#
# require the dsl lib to include all the methods you see below.
#
require 'dotenv'
Dotenv.load 

require 'rubygems'
require 'chatterbot/dsl'
require 'httparty'
require 'json'
require 'byebug'

puts "Loading jdoebot.rb"




def lookup(domain)
    parts = domain.split('.')
    output = HTTParty.get("https://api.namevine.com/domain?q=#{parts[0]}&x=#{parts[1]}")
    output = JSON.parse (output.body)
    return output["status"]
end

def is_a_reply_to_me(tweet)
    if tweet.text.include? "@jdoebot"
        return true
    end
end


verbose 
use_streaming 

puts "checking for replies to me"
home_timeline do |tweet|

    if is_a_reply_to_me(tweet) ; true
        puts "Got a tweet: #{tweet}"
        
        if tweet.text =~ /lookup ([a-z0-9]+\.[a-z]+)/i
            domain = $1.downcase
            parts = domain.split('.')
            name = parts[0]
            reply " #USER# Your domain #{domain} is #{lookup(domain)}, more info at https://namevine.com/#/#{name}",tweet
        
        elsif tweet.text =~ /lookup (https:\/\/[a-z0-9.\/_-]+)/i
            domain = tweet.urls[0].display_url
            parts = domain.split('.')
            name = parts[0]
            reply " #USER# Your domain #{domain} is #{lookup(domain)}, more info at https://namevine.com/#/#{name}",tweet

        else
            reply  "#USER# I don't understand that command. Try saying 'lookup yourdomain.com'",tweet
        
        end 

    end 
end

