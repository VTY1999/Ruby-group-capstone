require './src/source'

describe 'Testing source method' do
  it 'Should add item to source' do
    source = Source.new(name: 'HBO')
    item = double('item')
    allow(item).to receive(:add_source)
    source.add_item item
    expect(source.items.count).to eq 1
  end
end
