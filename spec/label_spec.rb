require_relative '../src/label'
require_relative '../src/item'

describe Item do
  before(:each) do
    @label = Label.new('Book', 'green')
  end

  context 'test Label class and its methods' do
    it 'check if @label is an instance of class Label' do
      expect(@label).to be_an_instance_of(Label)
    end

    it 'check if the add_item method return 1 item' do
      item = Item.new('Monalisa', '2020-02-20')
      @label.add_item(item)
      num_of_items = @label.items.length
      expect(num_of_items).to eq 1
    end
  end
end
