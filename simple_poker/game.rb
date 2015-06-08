class SimplePoker::Game
  attr_reader :players

  def initialize(players:, deck: SimplePoker::Deck.new)
    @players = players
    @deck = deck
  end

  def deal_cards
    players.each do |player|
      player.cards = @deck.get_2_cards
    end
    @common_cards = @deck.get_5_cards
  end

  def finish
  end
end
