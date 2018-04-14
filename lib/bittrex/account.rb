module Bittrex
  module Account
    def self.get_account(currency = "BTC")
      result = Bittrex::Net.get('account/getbalance', {currency: currency})
      Bittrex::Mapping.to_account(result["result"]) if result["success"] == true
    end
  end
end