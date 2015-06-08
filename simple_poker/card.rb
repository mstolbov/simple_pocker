class SimplePoker::Card
  attr_reader :suit, :kind

  def initialize(suit:, kind:)
    @suit = suit
    @kind = kind
  end
end
