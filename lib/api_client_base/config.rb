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

    # @return [Symbol] the env of this gem
    attr_accessor :env

  end
end
