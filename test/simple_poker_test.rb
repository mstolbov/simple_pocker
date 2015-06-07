require_relative "test_helper"

class SimplePokerTest < Minitest::Test
  def setup
  end

  def test_run
    assert SimplePoker.run
  end

end
