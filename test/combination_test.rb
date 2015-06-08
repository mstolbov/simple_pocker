require_relative "test_helper"

class CombinationTest < Minitest::Test

  def test_initialize_with_sort
    cards = [
      {:suit=>"spade", :kind=>"3"},
      {:suit=>"hart", :kind=>"K"},
      {:suit=>"spade", :kind=>"5"},
      {:suit=>"hart", :kind=>"2"},
      {:suit=>"spade", :kind=>"Q"}
    ].map {|h| SimplePoker::Card.new h}
    combination = SimplePoker::Combination.new(cards)

    first_card = combination.cards.first
    assert_equal "2", first_card.kind
    assert_equal "hart", first_card.suit

    last_card = combination.cards.last
    assert_equal "K", last_card.kind
    assert_equal "hart", last_card.suit
  end

  def test_flush_weigth
    cards1 = [
      {:suit=>"hart", :kind=>"T"},
      {:suit=>"hart", :kind=>"K"},
      {:suit=>"hart", :kind=>"A"},
      {:suit=>"hart", :kind=>"J"},
      {:suit=>"hart", :kind=>"Q"}
    ].map {|h| SimplePoker::Card.new h}
    combination1 = SimplePoker::Combination.new(cards1)
    assert_equal 6_12_11_10_9_8, combination1.weigth

    cards2 = [
      {:suit=>"spade", :kind=>"3"},
      {:suit=>"spade", :kind=>"K"},
      {:suit=>"spade", :kind=>"5"},
      {:suit=>"spade", :kind=>"9"},
      {:suit=>"spade", :kind=>"Q"}
    ].map {|h| SimplePoker::Card.new h}
    combination2 = SimplePoker::Combination.new(cards2)
    assert_equal 6_11_10_07_3_1, combination2.weigth
  end

end
