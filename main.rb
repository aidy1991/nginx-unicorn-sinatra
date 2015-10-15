require 'sinatra/base'
require 'unicorn'

class MainApp < Sinatra::Base
  get '/a' do
    'Hello world!'
  end
end
