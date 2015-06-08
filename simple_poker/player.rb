class SimplePoker::Player
  attr_reader :name
  attr_accessor :personal_cards, :common_cards, :combination

  def initialize(name: "Player")
    @name = name
  end

  def cards
    @cards ||= personal_cards + common_cards
  end
end
