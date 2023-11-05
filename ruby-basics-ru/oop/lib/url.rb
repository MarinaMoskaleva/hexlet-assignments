# frozen_string_literal: true

require 'uri'
require 'forwardable'

# BEGIN
class Url
    attr_accessor :str

    extend Forwardable
    include Comparable

    def initialize(params)
        @str = URI.parse(params)
    end

    def_delegators :@str, :scheme, :host, :port

    def query_params
        return {} if str.query.nil?
        rez_hash = {}
        str.query.split('&').each do |item|
            rez_hash[item.split('=')[0].to_sym]= item.split('=')[1]
        end
        rez_hash
    end

    def query_param(key, value = nil)
        url_params = self.query_params
        url_params.keys.include?(key) ? url_params[key] : value
    end

    def <=>(url)
        return nil unless url.is_a?(Url)

        cmp_rez = self.scheme <=> url.scheme
        return cmp_rez unless cmp_rez.zero?

        cmp_rez = self.port <=> url.port
        return cmp_rez unless cmp_rez.zero?

        cmp_rez = self.host <=> url.host
        return cmp_rez unless cmp_rez.zero?
        
        self_params = self.query_params
        url_params = url.query_params

        return 1 if  self_params.keys.length < url_params.keys.length
        return -1 if  self_params.keys.length > url_params.keys.length

        self_params.each do |key, value|
            cmp_rez = value <=> url_params[key]
            return cmp_rez unless cmp_rez.zero?
        end
        0
    end

end

# END
