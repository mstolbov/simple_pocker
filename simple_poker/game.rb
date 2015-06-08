class SimplePoker::Game
  attr_reader :players, :common_cards

  def initialize(players:, deck: SimplePoker::Deck.new)
    @players = players
    @deck = deck
  end

  def add_player(player)
    @players << player
  end

  def remove_player_by_name(name)
    player = @players.find {|p| p.name == name}
    @players.delete(player)
  end

  def deal_cards
    @deck.shuffle!

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
