# frozen_string_literal: true

require 'digest'
require 'json'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    if status == 200
      body.push(Digest::SHA256.hexdigest(body.join))
    end
    [status, headers, body]
  end
end
