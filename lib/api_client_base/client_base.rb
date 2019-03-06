module ApiClientBase
  class ClientBase

    def initialize env: :development
      @env = env
    end

    def env
      @env
    end

    def config
      Config.new
    end
  end
end
