class SimplePoker
  %w(card deck player game).each do |f|
    require_relative "simple_poker/#{f}"
  end

  attr_reader :game

  def initialize(players_count:)
    players = []
    players_count.times do |i|
      players << Player.new(name: "Player ##{i}")
    end

    deck = Deck.new
    @game = Game.new players: players, deck: deck
  end

  def run
    @game.deal_cards

    game.players.first #test
  end
end
