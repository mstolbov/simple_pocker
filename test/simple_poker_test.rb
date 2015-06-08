require_relative "test_helper"

class SimplePokerTest < Minitest::Test
  def setup
    @game = SimplePoker.new(players_count: 2, logger: Logger.new('/dev/null'))
  end

  def test_initialize_game_with_players
    assert_equal @game.game.players.count, 2
  end

  def test_run_and_return_winner
    assert @game.run.is_a? SimplePoker::Player
  end

end
