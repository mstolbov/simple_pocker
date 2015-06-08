require_relative "test_helper"

class GameTest < Minitest::Test
  def setup
    @player = SimplePoker::Player.new name: "Joe"
    @game = SimplePoker::Game.new players: [@player]
  end

  def test_deal_cards
    assert @player.cards.nil?
    assert @game.common_cards.nil?

    @game.deal_cards

    assert !@player.cards.empty?
    assert !@game.common_cards.empty?
  end

end
