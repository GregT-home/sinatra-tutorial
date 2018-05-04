require 'sinatra'
require 'pry'

configure do
  enable :sessions
end

get '/' do
  'Triggered by GET /'
end

get '/env' do
  request.env.map { |envar| "#{envar.to_s}\n" }
end

get '/set/:item' do
  item = params[:item]
  session[item] = params[:value]
end

get '/get/all' do
  session.map { |key,val| "#{key} = #{val}" }.join("\n")
end

get '/get/:item' do
  item = params[:item]
  value = session[item]

  if value.nil?
    "No value for session item '#{item}'"
  else
    "Saved session item '#{item}: #{value}" unless value.nil?
  end
end

get '/set_cookie/:flavor' do
  flavor = params[:flavor]
  value = params[:value]
  response.set_cookie flavor, value: value, path: '/get_cookie'
  "Cookie flavor '#{flavor}' set to value '#{value}'\n" + "other cookies: #{request.cookies}\n"
end

get '/get_cookie/all' do
  request.cookies.map { |key, val|  "#{key} = #{val}" }.join("\n")
end

get '/get_cookie/:flavor' do
  flavor = params[:flavor]
  value = request.cookies[flavor]
  "Cookie flavor '#{flavor}' has value '#{value}'"
end

delete '/get_cookie/:flavor' do
  flavor = params[:flavor]
  value = response.delete.cookie[flavor]
  "Cookie flavor '#{flavor}' has been deleted"
end

get '/logout' do
  session.clear
  "You are logged out"
end
