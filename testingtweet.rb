require 'json'
require 'byebug'
require 'rubygems'
require 'dotenv'
Dotenv.load
debugger
tweet = "@jdoebot lookup paintings.com"
returnedtweet = tweet.text.split(/\s+/)
    if returnedtweet.include? "lookup"
        puts "#{returnedtweet}"
    else
        exit
    
end



if tweet.text =~ /lookup ([a-z0-9]+\.[a-z]+)/i
    domain = $1.downcase
    availability = (lookup(domain) == "available")
end
