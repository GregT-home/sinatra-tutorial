require 'sinatra'
require 'pry'

%w[get post put delete patch options].each do |verb|
  %w[/one /two /three /].each do |route|
    self.__send__(verb, route) do
      headers custom_headers(verb)
      "Triggered by #{verb.upcase} #{route}"
    end
  end
end

get '/' do
  'Triggered by GET /'
end

def custom_headers(verb)
  {
    get: { 'X-verb-seen' => 'get'},
    put: { 'X-verb-seen' => 'put', 'X-extra-header' => 'this is additional for put verbs' }
  }[verb.to_sym]
end
