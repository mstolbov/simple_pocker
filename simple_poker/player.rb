class SimplePoker::Player
  attr_reader :name
  attr_accessor :personal_cards, :common_cards

  def initialize(name: "Player")
    @name = name
  end

  def best_combination
    combinations = cards.combination(5).map do|combination|
      combo = SimplePoker::Combination.new(combination)
      combo.determine
      combo
    end
    combinations.max_by {|c| c.weight}
  end

  private
  def cards
    @cards ||= personal_cards + common_cards
  end
end
