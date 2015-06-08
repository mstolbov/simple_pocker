class SimplePoker::Game
  attr_reader :players, :common_cards

  def initialize(players:, deck: SimplePoker::Deck.new)
    @players = players
    @deck = deck
    @deck.shuffle!
  end

  def add_player(player)
    @players << player
  end

  def deal_cards
    @common_cards = @deck.get_5_cards

    players.each do |player|
      player.personal_cards = @deck.get_2_cards
      player.common_cards = @common_cards
    end
  end

  def find_winner
    players.max_by {|p| p.find_best_combination.weight}
  end

end
