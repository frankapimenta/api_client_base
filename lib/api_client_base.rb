require 'dotenv'
Dotenv.load

require "api_client_base/version"

# outer most scope for gem
module ApiClientBase
  # defines an error exception for gem
  class Error < StandardError; end
end
