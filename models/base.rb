# -*- encoding: utf-8 -*-

require 'yajl'

require_relative '../lib/chatwork/client'


module Models
  class Base
    def initialize
      @chatwork = Lib::ChatWork::Client.new
    end

    def get_post
      @chatwork.get('/rooms')
    end
  end
end
