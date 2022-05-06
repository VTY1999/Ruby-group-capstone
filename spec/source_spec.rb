require './src/source'

describe Source do
  context 'When instantiated' do
    before(:all) do
      @source = Source.new('HBO')
    end

    it 'Should be an instance of class Source' do
      expect(@source).to be_an_instance_of Source
    end

    it 'Should return name' do
      expect(@source.name).to eq 'HBO'
    end

    it 'Should return []' do
      expect(@source.items).to eq []
    end
  end
end
