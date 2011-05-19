require './trade'
require 'test/unit'

class TradeTests < Test::Unit::TestCase

  def test_should_read_transactions
    @transactions = Records.read 'DM1182'
    assert_equal true, @transactions.length > 0
  end

  def test_should_fetch_factor
    @conversion = Conversion.new :from => 'CAD', :to => 'USD'
    assert_equal 1.0090, @conversion.factor 
  end

  def test_should_convert_transaction
    @conversion = Conversion.new :from => 'CAD', :to => 'USD'
    assert_equal 25.90, @conversion.convert(26.13)
  end

  def test_should_round_nearest_even
    @conversion = Conversion.new :from => 'CAD', :to => 'USD'
    assert_equal 26, @conversion.round(25.50)
    assert_equal 26, @conversion.round(26.50)
  end

  def test_should_round_two_decimals
    @conversion = Conversion.new :from => 'CAD', :to => 'USD'
    assert_equal 25.71, @conversion.round(25.7123)
  end

  def test_should_derive_factor

  end

end
