
require "minitest/autorun"
require "./lib/patron"


class PatronTest < Minitest::Test
  def setup
    @patron_1 = Patron.new("Bob", 20)
  end

  def test_patron_exist
    assert_instance_of Patron, @patron_1
  end

  def test_patron_has_attributes
    assert_equal "Bob", @patron_1.name
    assert_equal 20, @patron_1.spending_money
  end

  def test_patron_has_interests
    assert_equal [], @patron_1.interests
  end

  def test_patron_can_add_interest
    assert_equal [], @patron_1.interests
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], @patron_1.interests
  end
end