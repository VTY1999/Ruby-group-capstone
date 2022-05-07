require './src/item'
require './src/game'
require './src/author'

describe Game do
  context 'When testing the Game class' do
    before(:each) do
      @game1 = Game.new('Killer bean', Time.new(2001, 1, 11), true, Time.new(2000, 1, 11))
      @game2 = Game.new('Mario', Time.new(2018, 1, 11), true, Time.new(2017, 1, 11))
      @game3 = Game.new('Super Mario 2', Time.new(2004, 1, 11), true, Time.new(2020, 1, 11))
    end

    it 'should be an instance of the Game class' do
      expect(@game1).to be_an_instance_of Game
      expect(@game2).to be_an_instance_of Game
    end

    it 'should show the attribute of the game' do
      expect(@game1.publish_date).to eq Time.new(2001, 1, 11)
      expect(@game1.multiplayer).to eq(true)
      expect(@game1.last_played_at).to eq Time.new(2000, 1, 11)
    end
  end

  context 'When testing the relation of Game and Author class' do
    before(:each) do
      @game1 = Game.new('Killer bean', Time.new(2001, 1, 11), true, Time.new(2000, 1, 11))
      @game2 = Game.new('Mario', Time.new(2018, 1, 11), true, Time.new(2017, 1, 11))
      @game3 = Game.new('Super Mario Bros', Time.new(2004, 1, 11), true, Time.new(2020, 1, 11))
      @author1 = Author.new('Mark', 'K', 3333)
      @author2 = Author.new('Mario', 'Kennedy', 4444)
      @game1.author = @author1
      @game2.author = @author1
      @game3.author = @author2
    end

    it 'the add_author method should add an author to the game' do
      expect(@author1.items.length).to eq 2
    end
  end
end
