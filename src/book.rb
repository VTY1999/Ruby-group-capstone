require_relative './item'

class Book < Item
  attr_accessor :cover_state, :publisher, :name

  def initialize(name, publisher, cover_state, publish_date)
    super(name, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
