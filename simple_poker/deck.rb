class SimplePoker::Deck
  SUITS = %w(spade heart diamond club)
  KINDS = %w(2 3 4 5 6 7 8 9 T J Q K A)
  FULL_DECK_COUNT = 52

  attr_reader :cards

  def initialize
    fill_deck
  end

  def shuffle!
    fill_deck if @cards.count < FULL_DECK_COUNT

    @cards.shuffle!
  end

  def get_2_cards
    get_cards 2
  end

  def get_5_cards
    get_cards 5
  end

  private

  def fill_deck
    @cards = KINDS.product(SUITS).map do |pair|
      SimplePoker::Card.new(suit: pair[1], kind: pair[0])
    end
  end

  def get_cards(n)
    @cards.shift n
  end
end
