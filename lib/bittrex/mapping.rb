module Bittrex
  module Mapping
    def self.to_account(raw_data = {})
      Bittrex::Model::Account.new(
          currency: raw_data["Currency"],
          balance: raw_data["Balance"].to_f,
          available: raw_data["Available"].to_f,
          pending: raw_data["Pending"].to_f,
          crypto_address: raw_data["CryptoAddress"],
          requested: raw_data["Requested"],
          account_id: raw_data["Uuid"],
      )
    end
  end
end