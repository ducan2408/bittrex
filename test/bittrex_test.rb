require "test_helper"

class BittrexTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Bittrex::VERSION
  end
end
