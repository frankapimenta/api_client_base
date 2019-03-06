require 'yaml'
require 'erb'

module ApiClientBase
  # represents the configurations for this gem
  #
  # @author Frank Pimenta <frankapimenta@gmail.com>
  class Config

    # sets enviroments for this gem
    #   :default is the default env when no env is given/set
    def initialize env: :default, file_name: 'api_client_base.yml'
      @file_name = file_name
      raise Error.new "configuration file #{file_path} does not exist" unless File.exists? file_path

      @env = env

      define_methods_for_loaded_configurations
    end

    # @return [Symbol] the env of this gem
    attr_accessor :env

    # @return [String] the api authentication token
    attr_accessor :api_auth_token

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

    # @return [Hash] the configurations loaded from #file_path
    def configurations
      @configurations ||= load_configurations || {}
    end

    private def load_configurations
      file_extension      = File.extname(file_path)
      file_basename       = File.basename(file_path, file_extension)
      file_content        = File.read(file_path)
      file_content_parsed = ERB.new(file_content).result

      YAML::load(file_content_parsed)[file_basename][env.to_s]
    end

    private def define_methods_for_loaded_configurations
      configurations.each_pair do |k,v|
        instance_eval <<-METHODS
          @#{k} = v # set first value for configuration

          # define reader for #{k}
          def #{k}
            @#{k}
          end

          # define writter for #{k}
          def #{k}=(value)
            @#{k} = value
          end

        METHODS
      end
    end
  end
end
