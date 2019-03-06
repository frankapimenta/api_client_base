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
  end
end
