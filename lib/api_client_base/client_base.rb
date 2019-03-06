module ApiClientBase
  # this is the base class for the api client
  #
  # @author Frank Pimenta <frankapimenta@gmail.com>
  class ClientBase

    # sets development as the default enviroment this gem runs in
    def initialize env: :development
      @config = Config.new env: env
    end

    # @return [Symbol] the enviroment this gem is running in
    def env
      @config.env
    end

    # @yield [Config] instance if block given
    # @return [Config] the gem configurations
    def config
      yield @config if block_given?

      @config
    end

  end
end
