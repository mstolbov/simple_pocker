class SimplePoker::Game
  attr_reader :players, :common_cards

  def initialize(players:, deck: SimplePoker::Deck.new)
    @players = players
    @deck = deck
    @deck.shuffle!
  end

  def deal_cards
    @common_cards = @deck.get_5_cards

    players.each do |player|
      player.personal_cards = @deck.get_2_cards
      player.common_cards = @common_cards
    end
  end

  def determine_winner
    determine_combinations
    players.first
  end

  private
  def determine_combinations
    players.each do |player|
      player.best_combination
    end
  end
end
