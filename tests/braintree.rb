require '../braintree'
require 'test/unit'

class BrainTreeTests < Test::Unit::TestCase
  
  def test_should_validate_cc
    assert_equal true, BrainTree.luhn?("4111111111111111")
    assert_equal false, BrainTree.luhn?("4111111111111112")
    assert_equal true, BrainTree.luhn?("5105105105105100")
    assert_equal true, BrainTree.luhn?("4222222222222")
  end

  def test_should_validate_expiration
   assert_equal true, BrainTree.ccexp?("01/2000")
   assert_equal true, BrainTree.ccexp?("1/2000")
   assert_equal true, BrainTree.ccexp?("06/2010")
   assert_equal false, BrainTree.ccexp?("07/2010")
   assert_equal false, BrainTree.ccexp?("05/2015")
  end

  def test_should_calc_fabsum
    assert_equal 1, BrainTree.fibsum(1)
    assert_equal 2, BrainTree.fibsum(2)
    assert_equal 4, BrainTree.fibsum(3)
    assert_equal 7, BrainTree.fibsum(4)
    assert_equal 12, BrainTree.fibsum(5)
    assert_equal 20, BrainTree.fibsum(6)
    assert_equal 33, BrainTree.fibsum(7)
    assert_equal 196417, BrainTree.fibsum(25)
  end

  def test_should_return_morse_code
    assert_equal '.-', BrainTree.morse('a')
    assert_equal '-...', BrainTree.morse('B')
    assert_equal '......-...-..--- .-----.-..-..-..', BrainTree.morse('Hello World')
  end

  def test_should_mask_cc_numbers
    assert_equal '411111******1111', BrainTree.mask('4111111111111111')
    assert_equal '512351**5123', BrainTree.mask('512351235123')
  end
end
