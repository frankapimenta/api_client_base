module ApiClientBase
  class Config

    def initialize env: :default
      @env = env
    end

    def env
      @env
    end
  end
end
