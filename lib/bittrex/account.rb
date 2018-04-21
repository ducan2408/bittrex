module Bittrex
  module Account
    def self.get_account(currency = "BTC")
      response = Bittrex::Net.get('account/getbalance', {currency: currency})
      Bittrex::Mapping.to_account(response["result"]) if (response && response["success"] == true)
    end

    def self.get_accounts
      response = Bittrex::Net.get('account/getbalances')
      return unless (response && response["success"] == true)
      response["result"].map{ |acc| Bittrex::Mapping.to_account acc }
    end
  end
end