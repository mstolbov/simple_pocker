require_relative "test_helper"

class PlayerTest < Minitest::Test
  def setup
    @player = SimplePoker::Player.new name: "Joe"

    @player.personal_cards = [
      {:suit=>"spade", :kind=>"2"},
      {:suit=>"hart", :kind=>"A"},
    ].map {|h| SimplePoker::Card.new h}

    @player.common_cards   = [
      {:suit=>"spade", :kind=>"3"},
      {:suit=>"hart", :kind=>"K"},
      {:suit=>"spade", :kind=>"5"},
      {:suit=>"hart", :kind=>"2"},
      {:suit=>"spade", :kind=>"Q"}
    ].map {|h| SimplePoker::Card.new h}
  end

  def test_best_combination
    assert_equal 200121110, @player.best_combination.weight
    assert_equal :pair, @player.best_combination.name
  end

end
