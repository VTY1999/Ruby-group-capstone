class Label
  attr_reader :items, :title, :color

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(Item)
    @items << item
    item.label = self
  end
end