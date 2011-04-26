require 'sinatra/base'
require 'padrino-helpers'

class MaraTravel < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :views, File.dirname(__FILE__) + '/app/views'
  register Padrino::Helpers

  get '/' do
    haml :index
  end
end

