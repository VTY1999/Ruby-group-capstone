require_relative './item'

class Book < item
  attr_accessor :cover_state, :publisher
  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publish_date = publish_date
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end