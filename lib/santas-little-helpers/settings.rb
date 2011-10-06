module Santas::Little::Helpers

  class Settings

    def self.method_missing(name, *args)
      @@settings ||= ::Hash.new do |hash, key|
        hash[key] = YAML.load File.read("config/#{key}.yml")
      end

      key = name.to_s

      if defined?(::Rails)
        @@settings[key][::Rails.env] || @@settings[key]
      else
        @@settings[key]
      end
    rescue
      InfiniteHash.new
    end

    private

    class InfiniteHash < Hash
      def method_missing(*args)
        InfiniteHash.new
      end
    end

  end

end
