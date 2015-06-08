require_relative "test_helper"

class PlayerTest < Minitest::Test
  def setup
    @player = SimplePoker::Player.new name: "Joe"
    deck = SimplePoker::Deck.new
    @player.personal_cards = deck.get_2_cards
    @player.common_cards   = deck.get_5_cards
  end

  def test_best_combination
    skip
    #assert @player.best_combination
  end

end
