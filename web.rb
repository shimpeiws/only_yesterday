require 'sinatra'
require 'sinatra/reloader'
require "sinatra/json"
require 'erb'
get '/' do
  erb :index
end

get '/param/:id' do
    "param test [id = #{params[:id]}]"
end

get '/api' do
  data = { foo: "bar" }
  json data
end

