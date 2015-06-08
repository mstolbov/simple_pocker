class SimplePoker::Card
  attr_reader :suit, :kind

  def initialize(suit:, kind:)
    @suit = suit
    @kind = kind
  end

  def to_s
    "#{kind} #{suit}"
  end

end
