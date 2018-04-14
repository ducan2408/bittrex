module Bittrex
  module Mapping
    def self.to_account(raw_data = {})
      Bittrex::Model::Account.new(
          currency: raw_data["Currency"],
          balance: raw_data["Balance"],
          available: raw_data["Available"],
          pending: raw_data["Pending"],
          crypto_address: raw_data["CryptoAddress"],
          requested: raw_data["Requested"],
          account_id: raw_data["Uuid"],
      )
    end
  end
end