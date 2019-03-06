module ApiClientBase
  # represents the configurations for this gem
  #
  # @author Frank Pimenta <frankapimenta@gmail.com>
  class Config

    # sets enviroments for this gem
    #   :default is the default env when no env is given/set
    def initialize env: :default
      @env = env
    end

    # @return [Symbol] the enviroment this gem runs in
    def env
      @env
    end
  end
end
