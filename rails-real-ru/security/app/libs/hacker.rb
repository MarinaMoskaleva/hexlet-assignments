# frozen_string_literal: true

require 'open-uri'

class Hacker
  class << self
    def hack(email, password)
      uri = URI('https://rails-collective-blog-ru.hexlet.app/users')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new "#{uri}/sign_up"

      response = http.request request

      cookie = response.response['set-cookie'].split('; ')[0]

      token = get_token response.body

      new_user = {
        email: email,
        password: password,
        password_confirmation: password,
      }
        
      params = {
        user: new_user,
        authenticity_token: token,
        commit: 'Регистрация'
      }

      request = Net::HTTP::Post.new uri
      request.body = URI.encode_www_form(params)
      request['Cookie'] = cookie
      

      response = http.request request

      response.code == '302'
    end

    private

    def get_token(text)
      html = Nokogiri::HTML(text)
      token = html.at('input[name="authenticity_token"]')['value']
    end
  end
end
