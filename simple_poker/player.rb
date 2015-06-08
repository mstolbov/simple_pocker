class SimplePoker::Player
  attr_reader :name
  attr_accessor :personal_cards, :common_cards

  def initialize(name: "Player")
    @name = name
  end

  def determine_combination
    combinations = cards.combination(5).map do|combination|
      SimplePoker::Combination.determine(combination)
    end
    combinations
  end

  private
  def cards
    @cards ||= personal_cards + common_cards
  end
end
