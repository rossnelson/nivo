module Nivo
  class Config
    def self.file
      raw_config = File.read("#{Rails.root}/config/nivo_config.yml")
      config = YAML.load(raw_config)
    end
  end
end
