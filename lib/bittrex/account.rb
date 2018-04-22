module Bittrex
  module Account
    class << self
      def get_account(currency = "BTC")
        response = Bittrex::Net.get('account/getbalance', { currency: currency.upcase } )
        result, error_response = guard(response)
        return error_response unless result
        Bittrex::Mapping.to_account(response["result"])
      end

      def get_accounts
        response = Bittrex::Net.get('account/getbalances')
        result, error_response = guard(response)
        return error_response unless result
        response["result"].map{ |acc| Bittrex::Mapping.to_account acc }
      end

      def guard(response)
        if response.nil?
          [false, ResponseFail.new(success: false, errors: "Nothing return in response")]
        elsif response["success"] == false
          [false, ResponseFail.new(success: response["success"], errors: response["message"])]
        else
          true
        end
      end
    end
  end
end