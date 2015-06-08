class SimplePoker::Deck
  SUITS = %i(spade heart diamond club)
  KINDS = %i(A 2 3 4 5 6 7 8 9 T J Q K)

  attr_reader :cards

  def initialize
    @cards = []
    SUITS.each do |suit|
      KINDS.each do |kind|
        @cards << SimplePoker::Card.new(suit: suit, kind: kind)
      end
    end
    @cards.shuffle!
  end

  def get_2_cards
    get_cards 2
  end

  def get_5_cards
    get_cards 5
  end

  private

  def get_cards(n)
    @cards.shift n
  end
end
