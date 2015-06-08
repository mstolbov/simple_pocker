require_relative "test_helper"

class SimplePokerTest < Minitest::Test
  def test_initialize_game_with_players
    poker = SimplePoker.new(players_count: 2)
    assert_equal poker.game.players.count, 2
  end

  def test_run_and_return_winner
    game = SimplePoker.new(players_count: 2)
    assert game.run.is_a? SimplePoker::Player
  end

end
