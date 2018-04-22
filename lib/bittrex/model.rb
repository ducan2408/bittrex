require "virtus"
module Bittrex
  module Model
    class Account
      include Virtus.model

      attribute :currency, String
      attribute :balance, Float
      attribute :available, Float
      attribute :pending, Float
      attribute :crypto_address, String
      attribute :requested, Boolean
      attribute :account_id, String
    end
  end
end