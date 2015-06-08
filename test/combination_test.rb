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

  def test_flush_weight
    cards = [
      {:suit=>"hart", :kind=>"T"},
      {:suit=>"hart", :kind=>"K"},
      {:suit=>"hart", :kind=>"A"},
      {:suit=>"hart", :kind=>"J"},
      {:suit=>"hart", :kind=>"Q"}
    ].map {|h| SimplePoker::Card.new h}
    combination = SimplePoker::Combination.new(cards)
    assert_equal 6_12_11_10_9_8, combination.weight
  end

  def test_straight_weight
    cards1 = [
      {:suit=>"hart", :kind=>"3"},
      {:suit=>"spade", :kind=>"A"},
      {:suit=>"spade", :kind=>"5"},
      {:suit=>"hart", :kind=>"4"},
      {:suit=>"spade", :kind=>"2"}
    ].map {|h| SimplePoker::Card.new h}
    combination1 = SimplePoker::Combination.new(cards1)
    assert_equal 5_03_02_01_0_0, combination1.weight

    cards2 = [
      {:suit=>"hart", :kind=>"K"},
      {:suit=>"spade", :kind=>"A"},
      {:suit=>"spade", :kind=>"Q"},
      {:suit=>"hart", :kind=>"T"},
      {:suit=>"spade", :kind=>"J"}
    ].map {|h| SimplePoker::Card.new h}
    combination2 = SimplePoker::Combination.new(cards2)
    assert_equal 5_12_11_10_9_8, combination2.weight
  end

  def test_set_weight
    cards1 = [
      {:suit=>"hart", :kind=>"A"},
      {:suit=>"spade", :kind=>"A"},
      {:suit=>"spade", :kind=>"5"},
      {:suit=>"hart", :kind=>"A"},
      {:suit=>"spade", :kind=>"2"}
    ].map {|h| SimplePoker::Card.new h}
    combination1 = SimplePoker::Combination.new(cards1)
    assert_equal 4_12_00_03_00, combination1.weight

    cards2 = [
      {:suit=>"hart", :kind=>"T"},
      {:suit=>"spade", :kind=>"A"},
      {:suit=>"spade", :kind=>"T"},
      {:suit=>"hart", :kind=>"T"},
      {:suit=>"spade", :kind=>"J"}
    ].map {|h| SimplePoker::Card.new h}
    combination2 = SimplePoker::Combination.new(cards2)
    assert_equal 4_08_00_12_09, combination2.weight
  end

  def test_two_pair_weight
    cards = [
      {:suit=>"hart", :kind=>"A"},
      {:suit=>"spade", :kind=>"A"},
      {:suit=>"spade", :kind=>"K"},
      {:suit=>"hart", :kind=>"K"},
      {:suit=>"spade", :kind=>"9"}
    ].map {|h| SimplePoker::Card.new h}
    combination = SimplePoker::Combination.new(cards)
    assert_equal 3_12_11_00_07, combination.weight
  end

  def test_pair_weight
    cards = [
      {:suit=>"hart", :kind=>"A"},
      {:suit=>"spade", :kind=>"Q"},
      {:suit=>"spade", :kind=>"K"},
      {:suit=>"hart", :kind=>"9"},
      {:suit=>"spade", :kind=>"9"}
    ].map {|h| SimplePoker::Card.new h}
    combination = SimplePoker::Combination.new(cards)
    assert_equal 2_07_12_11_10, combination.weight
  end

  def test_high_card_weight
    cards = [
      {:suit=>"hart", :kind=>"A"},
      {:suit=>"spade", :kind=>"Q"},
      {:suit=>"spade", :kind=>"K"},
      {:suit=>"hart", :kind=>"4"},
      {:suit=>"spade", :kind=>"9"}
    ].map {|h| SimplePoker::Card.new h}
    combination = SimplePoker::Combination.new(cards)
    assert_equal 1_12_00_00_00, combination.weight
  end

end
