module ApiClientBase
  class ClientBase

    def initialize env: :development
      @env = env
    end

    def env
      @env
    end
  end
end
