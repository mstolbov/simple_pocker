class SimplePoker::Combination
  class << self
    def determine(cards)
      :flush if flush?(cards)
    end

    private
    def flush?(cards)
      suits = {
        spade: 0,
        heart: 0,
        diamond: 0,
        club: 0
      }
      cards.each do |card|
        suits[card.suit] += 1
      end

      suits.values.sort.last >= 5
    end
  end
end
