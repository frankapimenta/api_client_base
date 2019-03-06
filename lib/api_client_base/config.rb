require 'yaml'

module ApiClientBase
  # represents the configurations for this gem
  #
  # @author Frank Pimenta <frankapimenta@gmail.com>
  class Config

    # sets enviroments for this gem
    #   :default is the default env when no env is given/set
    def initialize env: :default, file_name: 'api_client_base.yml'
      @env = env
      @file_name = file_name
    end

    # @return [Symbol] the env of this gem
    attr_accessor :env

    # @return [String] the configuration file name
    attr_reader :file_name

    # @return [Path] the path to the config folder of this gem
    def config_path
      Pathname.new File.expand_path('config')
    end

    # @return [String] full path to configuration file
    def file_path
      File.join(config_path, @file_name)
    end

    def configurations
      @configurations ||= load_configurations || {}
    end

    private def load_configurations
      file_extension = File.extname(file_path)
      file_basename  = File.basename(file_path, file_extension)

      YAML::load_file(file_path)[file_basename][env.to_s]
    end
  end
end
