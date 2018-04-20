require "bittrex/version"
require "bittrex/model"
require "bittrex/net"
require "bittrex/account"

module Bittrex
  class << self
    attr_accessor :secret, :key

    def configured?
      secret && key
    end

    def sanity_check?
      unless self.configured?
        raise MissingConfigExeception.new("Missing Bittrex config")
      end
    end
  end
  class MissingConfigExeception < RuntimeError; end
end
