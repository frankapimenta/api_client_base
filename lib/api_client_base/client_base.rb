module ApiClientBase
  # this is the base class for the api client
  #
  # @author Frank Pimenta <frankapimenta@gmail.com>
  class ClientBase

    attr_reader :config

    # sets development as the default enviroment this gem runs in
    def initialize env: :development
      @config = Config.new env: env
    end

    # @return [Symbol] the enviroment this gem is running in
    def env
      @config.env
    end

  end
end
