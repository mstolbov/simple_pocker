class SimplePoker::Combination
  SUITS = %w(spade heart diamond club)
  KINDS = %w(2 3 4 5 6 7 8 9 T J Q K A)

  attr_reader :cards

  def initialize(combination)
    @cards = combination.sort {|a ,b| KINDS.index(a.kind) <=> KINDS.index(b.kind)}
  end

  def weigth
    flush
    #[flush].max
  end

  private

  def kinds
    @cards.map {|c| c.kind}
  end

  def suits
    @cards.map {|c| c.suit}
  end

  def weigth_of(val)
    KINDS.index(val) || 0
  end

  def flush
    if suits.uniq.size == 1
      [
        600000000,
        1000000 * weigth_of(kinds[-1]),
        10000 * weigth_of(kinds[-2]),
        100 * weigth_of(kinds[-3]),
        10 * weigth_of(kinds[-4]),
        weigth_of(kinds[-5])
      ].reduce(:+)
    end
  end

end
