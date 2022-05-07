require './src/author'

describe Author do
  context 'When testiing the Author' do
    before(:each) do
      @author1 = Author.new('Kandi', 'Kamuntu', 1)
      @author2 = Author.new('Verissimo', 'Francis', 3)
      @author3 = Author.new('Isaac', 'Samuel', 5)
    end

    it 'should be an instance of the Author class' do
      expect(@author1).to be_an_instance_of Author
    end

    it 'should be an instance of the Author class' do
      expect(@author2).to be_an_instance_of Author
    end

    it 'should be an instance of the Author class' do
      expect(@author3).to be_an_instance_of Author
    end
  end

  context 'When testing the Author class' do
    it 'should add an item to the author' do
      author = Author.new('Kandi', 'Kamuntu', 1)
      item = double('item')
      allow(item).to receive(:label=).with(author)
      allow(item).to receive(:move_to_archive)
      author.add_item(item)
      expect(author.items).to include(item)
      expect(author.items.count).to eq(1)
    end
  end
end
