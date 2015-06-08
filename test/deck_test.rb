require_relative "test_helper"

class DeckTest < Minitest::Test
  def setup
    @deck = SimplePoker::Deck.new
    @poker_deck_count = SimplePoker::Deck::FULL_DECK_COUNT
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
    assert_equal @poker_deck_count-2, @deck.cards.count

    cards = @deck.get_5_cards
    assert_equal cards.count, 5
    assert_equal @poker_deck_count-7, @deck.cards.count
  end

  def test_fill_deck_with_suffle
    @deck.get_5_cards
    assert_equal @poker_deck_count-5, @deck.cards.count

    @deck.shuffle!

    assert_equal @poker_deck_count, @deck.cards.count
  end

end
