require_relative '../src/book'
require_relative '../src/item'

describe Book do
  before(:each) do
    @book = Book.new('Monalisa', 'Kandy', 'bad', '2020-12-03')
  end

  context 'while testing the Book class hierarchy' do
    it 'check if the book inherits from the Item class ' do
      expect(@book).to be_kind_of(Item)
    end

    it 'book should be an instance of Book class' do
      expect(@book).to be_an_instance_of Book
    end
  end

  context 'test Book\'s instance variables' do
    it 'check if it returns the name variable' do
      name = @book.name
      expect(name).to eq 'Monalisa'
    end
    it 'check if it returns the publisher variable' do
      publisher_name = @book.publisher
      expect(publisher_name).to eq 'Kandy'
    end
    it 'check if it returns the publish_date variable' do
      publish_date = @book.publish_date
      expect(publish_date).to eq '2020-12-03'
    end
  end
end
