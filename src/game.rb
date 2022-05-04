class Game
  attr_accessor :multiplayer, :last_played_at

  # rubocop:disable Metrics/ParameterLists
  def initialize(name:, publish_date:, multiplayer:, last_played_at:, id: Random.rand(1...1000), archived: false)
    super(name: name, publish_date: publish_date, id: id, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
  # rubocop:enable Metrics/ParameterLists

  private

  def can_be_archived?
    super && (last_played_at.year < Time.new.year - 2)
  end
end
