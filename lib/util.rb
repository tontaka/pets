# -*- encoding: utf-8 -*-

require 'yaml'

module Lib
  module Util
    class << self

      @@root_dir = nil

      def load_yaml(path)
        ::YAML::load_file(path)
      end

      def get_root_dir
        if @@root_dir.nil?
          @@path = __FILE__
          2.times { @@path = File.dirname(@@path) }
        end

        @@path
      end

      def get_config_dir
        get_root_dir + '/config'
      end
    end
  end
end
