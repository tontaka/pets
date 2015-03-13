require 'sinatra'
require 'json'

require_relative 'models/base'

# そんなにroute多くないので直に宣言する

get '/status' do
  model = Models::Base.new
  model.get_post.to_json
  #ret = {
  #  id: 1
  #}

  #ret.to_json
end
