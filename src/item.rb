class Item
  attr_accessor :genre, :publish_date
  attr_reader :id, :label, :author, :source, :archived

  def initialize(name, publish_date, archived: false)
    @name = name
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def source=(source)
    @source = source
    @source.items.push(self) unless @source.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    return true if @publish_date.year < Time.new.year - 10
  end
end
