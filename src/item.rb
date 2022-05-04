class Item
  attr_accessor :genre, :source, :author, :publish_date
  attr_reader :id, :label

  def initialize(_id, name, publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @name = name
    @archived = archived
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  private

  def can_be_archived?
    return true if @publish_date.year < Time.new.year - 10
  end
end
