
require "minitest/autorun"
require "./lib/museum"
require "./lib/patron"
require "./lib/exhibit"

class MuseumTest < Minitest::Test
  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  def test_museum_exist
    assert_instance_of Museum, @dmns
  end

  def test_museum_has_attributes
    assert_equal "Denver Museum of Nature and Science", @dmns.name
  end

  def test_museum_has_exhibits
    assert_equal [], @dmns.exhibits
  end
end
