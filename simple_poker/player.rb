class SimplePoker::Player
  attr_reader :name
  attr_accessor :personal_cards, :common_cards

  def initialize(name: "Player")
    @name = name
  end

  def best_combination
    combinations = cards.combination(5).map do|combination|
      SimplePoker::Combination.new(combination).weigth
    end
    combinations.compact.max
  end

  private
  def cards
    @cards ||= personal_cards + common_cards
  end
end
