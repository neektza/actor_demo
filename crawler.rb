RootDir = File.expand_path(File.dirname(__FILE__))

require 'bundler/setup'
require 'rubygems'
require 'celluloid'
require 'celluloid/io'
require 'bunny'

require_relative 'publisher'
require_relative 'feed_supervisor'

class Crawler < Celluloid::SupervisionGroup
  supervise Publisher, as: :Publisher
  supervise FeedSupervisor, as: :MeetupSupervisor, args: [:meetup]
  supervise FeedSupervisor, as: :TwitterSupervisor, args: [:twitter]
  supervise FeedSupervisor, as: :GithubSupervisor, args: [:github]
end

Crawler.run
