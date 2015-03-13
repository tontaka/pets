# -*- encoding: utf-8 -*-

require 'net/https'
require 'rack/utils'
require 'openssl'

require_relative '../util'

module Lib
module ChatWork
  class Client

    def initialize
      yml = Lib::Util.get_config_dir + '/chatwork.yml'
      @config = Lib::Util.load_yaml(yml)
    end

    def get(path, params = {})
      path << '?' + Rack::Utils.build_query(params) unless params.empty?
      request(Net::HTTP::Get.new(path, {'X-ChatWorkToken' => @config[:api][:token]}))
    end

    def request(req)
      http = Net::HTTP.new(@config[:api][:host], 443)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      # 適切に証明書の検証を行う場合は以下
      #http.ca_file = 'path to ca'
      #http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      res = http.start do |h|
        h.request(req)
      end

      Yajl::Parser.parse(res.body)
    end

  end
end
end
