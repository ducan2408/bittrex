module Bittrex
  module Mapping
    class << self
      def to_account(raw_data = {})
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

      def to_deposit_address(raw_data = {})
        Bittrex::Model::DepositAddress.new(
          currency: raw_data["Currency"],
          address: raw_data["Address"],
        )
      end
    end
  end
end