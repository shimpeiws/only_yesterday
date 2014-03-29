require 'sinatra'
require 'sinatra/reloader'
get '/' do
  'Hello world!(restart)'
end

get '/param/:id' do
    "param test [id = #{params[:id]}]"
end
