# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    request = Rack::Request.new(env)
    if ["/about", "/"].include? request.path
      [200, {}, []]
    else 
      [404, {}, []]
    end
  end
end
