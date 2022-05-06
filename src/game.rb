require './src/item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :name

  def initialize(name, publish_date, multiplayer, last_played_at)
    super(name, publish_date)
    @id = Random.rand(1...1000)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    super && (last_played_at.year < Time.new.year - 2)
  end
end
