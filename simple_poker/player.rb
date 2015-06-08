class SimplePoker::Player
  attr_reader :name
  attr_accessor :cards

  def initialize(name: "Player")
    @name = name
  end
end
