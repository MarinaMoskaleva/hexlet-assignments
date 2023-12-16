# frozen_string_literal: true

class SetLocaleMiddleware
  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)
    @status, @header, @response = app.call(env)
    requested_locale = env['HTTP_ACCEPT_LANGUAGE']
    if requested_locale.blank?
      I18n.locale = I18n.default_locale
    else
      I18n.locale = requested_locale.scan(/^[a-z]{2}/).first || I18n.default_locale
    end
    app.call(env)
  end
end
