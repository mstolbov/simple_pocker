require_relative "test_helper"

class DeckTest < Minitest::Test
  def setup
    @deck = SimplePoker::Deck.new
    @poker_deck_count = 52
  end

  def test_initialize
    assert_equal @deck.cards.count, @poker_deck_count
    assert @deck.cards.first.is_a? SimplePoker::Card
    assert_equal "spade", @deck.cards.first.suit
    assert_equal "2", @deck.cards.first.kind
  end

  def test_getting_cards
    cards = @deck.get_2_cards
    assert_equal cards.count, 2
    assert_equal @deck.cards.count, @poker_deck_count - 2

    cards = @deck.get_5_cards
    assert_equal cards.count, 5
    assert_equal @deck.cards.count, @poker_deck_count - 7
  end

end
