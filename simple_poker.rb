require 'logger'

class SimplePoker
  %w(card deck player game combination).each do |f|
    require_relative "simple_poker/#{f}"
  end

  attr_reader :game

  def initialize(players_count:, rounds: 1, logger: Logger.new(STDOUT))
    players = []
    players_count.times do |i|
      players << Player.new(name: "Player ##{i}")
    end
    @rounds = rounds
    @logger = logger

    deck = Deck.new
    @game = Game.new players: players, deck: deck
  end

  def run
    game.deal_cards
    winner = game.find_winner

    @logger.info "Game result:" \
      "\nWinner is #{winner}" \
      "\nTable: #{@game.common_cards.map(&:to_s).join(", ")}" \
      "\nCombination: #{winner.combination}"

    winner
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
