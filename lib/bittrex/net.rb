require 'rest-client'
require "net/http"
require "openssl"

module Bittrex
  module Net
    VERSION = "v1.1"
    def self.to_url(path, params)
      "https://bittrex.com/api/#{VERSION}/#{path}?#{params}"
    end

    def self.get(path, option = {})
      Bittrex.santity_check?
      begin
        params_path = URI.encode_www_form(option.merge(self.default_params))
        result = RestClient.get(self.to_url(path, params_path))
        result.body
      rescue RestClient::BadRequest => e
        raise BadRequest.new(e.response)
      end
    end

    private

    def self.header_for(path)
      p path
    end

    def self.default_params
      params = {}
      params["apikey"] = Bittrex.key
      params
    end
  end
  class BadRequest < RuntimeError; end
end