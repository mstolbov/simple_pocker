require_relative "test_helper"

class GameTest < Minitest::Test
  def setup
    @player = SimplePoker::Player.new name: "Bill"
    @game = SimplePoker::Game.new players: [@player]
  end

  def test_deal_cards
    assert @player.personal_cards.nil?
    assert @game.common_cards.nil?

    @game.deal_cards

    assert !@player.personal_cards.empty?
    assert !@game.common_cards.empty?
  end

  def test_find_winner
    new_player = SimplePoker::Player.new name: "Joe"

    common_cards = [
      {:suit=>"spade", :kind=>"3"},
      {:suit=>"hart", :kind=>"K"},
      {:suit=>"spade", :kind=>"5"},
      {:suit=>"hart", :kind=>"2"},
      {:suit=>"spade", :kind=>"Q"}
    ].map {|h| SimplePoker::Card.new h}


    new_player.personal_cards = [
      {:suit=>"spade", :kind=>"2"},
      {:suit=>"spade", :kind=>"A"},
    ].map {|h| SimplePoker::Card.new h}

    @player.personal_cards = [
      {:suit=>"spade", :kind=>"2"},
      {:suit=>"hart", :kind=>"A"},
    ].map {|h| SimplePoker::Card.new h}

    @player.common_cards    = common_cards
    new_player.common_cards = common_cards

    @game.add_player new_player

    assert_equal "Joe", @game.find_winner.name
    assert_equal :flush, @game.find_winner.combination.name
  end

end
