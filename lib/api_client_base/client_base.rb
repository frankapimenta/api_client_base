module ApiClientBase
  class ClientBase

    attr_reader :config

    def initialize env: :development
      @config = Config.new env: env
    end

    def env
      @config.env
    end

  end
end
