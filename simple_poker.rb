class SimplePoker
  %w(card deck player game combination).each do |f|
    require_relative "simple_poker/#{f}"
  end

  attr_reader :game

  def initialize(players_count:, rounds: 1)
    players = []
    players_count.times do |i|
      players << Player.new(name: "Player ##{i}")
    end
    @rounds = rounds

    deck = Deck.new
    @game = Game.new players: players, deck: deck
  end

  def run
    game.deal_cards
    game.find_winner
  end

  def loop_run
    @rounds.times { run }
  end

  def add_player(player)
    @game.add_player player
  end

  def remove_player(name)
    @game.remove_player_by_name name
  end
end
