class SimplePoker::Combination
  SUITS = %w(spade heart diamond club)
  KINDS = %w(2 3 4 5 6 7 8 9 T J Q K A)

  attr_reader :cards, :name, :weight

  def initialize(cards)
    @cards = cards.sort {|a ,b| KINDS.index(a.kind) <=> KINDS.index(b.kind)}
  end

  def determine
    @weight, @name = [flush, straight, set, two_pairs, pair, high_card].compact.max
  end

  def to_s
    "#{name.capitalize} \"#{cards.map(&:to_s).join(", ")}\""
  end

  private

  def kinds
    @cards.map {|c| c.kind}
  end

  def suits
    @cards.map {|c| c.suit}
  end

  def weight_of(val)
    KINDS.index(val) || 0
  end

  def kind_repeated(n)
    kinds.select {|x| kinds.count(x) == n}
  end

  def flush
    if suits.uniq.size == 1
      val = [
        600000000,
        1000000 * weight_of(kinds[-1]),
        10000 * weight_of(kinds[-2]),
        100 * weight_of(kinds[-3]),
        10 * weight_of(kinds[-4]),
        weight_of(kinds[-5])
      ].reduce(:+)
      [val, :flush]
    end
  end

  def straight
    if kinds.last == "A" && kinds.first == "2"
      values = ["A1"].concat kinds[0..3]
    else
      values = kinds
    end
    if (["A1"] << KINDS).join.include?(values.join)
      val = [
        500000000,
        1000000 * weight_of(values[-1]),
        10000 * weight_of(values[-2]),
        100 * weight_of(values[-3]),
        10 * weight_of(values[-4]),
        weight_of(values[-5]) # "A1" will return 0
      ].reduce(:+)
      [val, :straight]
    end
  end

  def set
    card = kind_repeated(3).last
    if card
      kikers = kinds.select {|x| x != card}
      val = [
        400000000,
        1000000 * weight_of(card),
        100 * weight_of(kikers[1]),
        weight_of(kikers[0])
      ].reduce(:+)
      [val, :set]
    end
  end

  def two_pairs
    pairs = kind_repeated(2).uniq
    if pairs.count == 2
      kiker = kinds.select {|x| !pairs.include?(x)}.last
      val = [
        300000000,
        1000000 * weight_of(pairs.last),
        10000 * weight_of(pairs.first),
        weight_of(kiker),
      ].reduce(:+)
      [val, :two_pairs]
    end
  end

  def pair
    pairs = kind_repeated(2).uniq
    if pairs.count == 1
      pair = pairs.last
      kikers = kinds.select {|x| pair != x}
      val = [
        200000000,
        1000000 * weight_of(pair),
        10000 * weight_of(kikers[2]),
        100 * weight_of(kikers[1]),
        weight_of(kikers[0])
      ].reduce(:+)
      [val, :pair]
    end
  end

  def high_card
    val = [
      100000000,
      1000000 * weight_of(kinds[-1])
    ].reduce(:+)
    [val, :high_card]
  end

end
