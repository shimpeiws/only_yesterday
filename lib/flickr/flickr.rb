# -*- coding: utf-8 -*-    

require 'open-uri'
require 'json'
require 'flickraw'
require 'pp'
require './../../secret/secret' if ENV['FLICKR_API_KEY'].nil?
require './flickr_image'
require './auth'
require './search'

module FlickrUtil

  FlickRaw.api_key = ENV['FLICKR_API_KEY']
  FlickRaw.shared_secret = ENV['FLICKR_SECRET_KEY']
  
end

FlickrUtil::Auth::test
# pp FlickrUtil::Search::get_recent
pp FlickrUtil::Search::get_photoset 72157631811283140
