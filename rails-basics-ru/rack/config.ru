# frozen_string_literal: true

require_relative 'lib/app'

Rack::Handler::Thin.run App.init, Port: 3001, Host: '0.0.0.0'
