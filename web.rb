require 'sinatra'
require 'sinatra/reloader'
require "sinatra/json"
require 'erb'
require 'open-uri'
require 'json'
require './lib/open_weather'
get '/' do
  erb :index
end

get '/param/:id' do
    "param test [id = #{params[:id]}]"
end

get '/api/test' do
    "param test [id = #{OpenWeatherUtil::Search::byLL(35, 140)}]"
end

get '/api' do
  lat = params['lat']
  lon = params['lon']
  wether = OpenWeatherUtil::Search::byLL(lat, lon)
  data = {wether: wether}
  json data
end

