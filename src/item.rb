class Item
  attr_accessor :genre, :label, :source, :author, :publish_date

  def initialize(name, publish_date, archived = false )
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @name = name
    @archived = archived
  end
end