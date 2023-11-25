# frozen_string_literal: true

require 'digest'
require 'json'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, _ = @app.call(env)
    request = Rack::Request.new(env)
    case request.path
    when "/"
      body = String.new("Hello, World!")
      body_hash = Digest::SHA256.hexdigest body
      body << body_hash
      [status, headers, [body]]
    when "/about"
      body = String.new("About page")
      body_hash = Digest::SHA256.hexdigest body
      body << body_hash
      [status, headers, [body]]
    else
      [status, headers, ["404 Not Found"]]
    end
  end
end
