module Bittrex
  module Model
    class Account
      include Virtus.model

      attribute :currency, String
      attribute :balance, Decimal
      attribute :available, Decimal
      attribute :pending, Decimal
      attribute :crypto_address, String
      attribute :requested, Boolean
      attribute :account_id, String
    end
  end
end