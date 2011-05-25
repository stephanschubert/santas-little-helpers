module Santas::Little::Helpers

  class Settings

    def self.method_missing(name, *args)
      @@settings ||= Hash.new do |hash, key|
        hash[key] = YAML.load File.read("config/#{key}.yml")
      end

      key = name.to_s

      puts "HALLO"
      puts defined?(::Rails).inspect

      if defined?(::Rails)
        @@settings[key][::Rails.env]
      else
        @@settings[key]
      end
    rescue
      {}
    end

  end

end
