require 'rest-client'
require "net/http"
require "openssl"
require "json"

module Bittrex
  module Net
    VERSION = "v1.1"
    class << self
      def to_url(path, params_string)
        "https://bittrex.com/api/#{VERSION}/#{path}?#{params_string}"
      end

      def get(url, option = {})
        begin
          nonce = Time.now.to_i
          params = option.merge(default_params(nonce))
          string_params = URI.encode_www_form(params)
          path = to_url(url, string_params)
          result = RestClient.get(path, header_for(path))
          JSON.parse(result.body)
        rescue RestClient::BadRequest => e
          raise BadRequest.new(e.response)
        end
      end

      private

      def header_for(path)
        header = {}
        header[:apisign] = signature(path)
        header
      end

      def signature(path)
        OpenSSL::HMAC.hexdigest('sha512', Bittrex.secret, path)
      end

      def default_params(nonce)
        params = {}
        params["apikey"] = Bittrex.key
        params["nonce"] = nonce if nonce
        params
      end
    end
  end
  class BadRequest < RuntimeError; end
end