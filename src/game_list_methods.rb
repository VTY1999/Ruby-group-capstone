require_relative './game'
require_relative './author'
require_relative '../data/authors/author_crud'
require_relative '../data/games/game_crud'
require_relative './game_date_template'

module GameListMethods
  include SaveGameData
  include SaveAuthorData
  include GameDateTemplate

  def list_all_authors
    # authors = read_games('authors')
    authors.each do |author|
      puts "id: #{author.id} name: '#{author.first_name} #{author.last_name}'"
    end
  end

  def list_of_games
    if @authors.empty?
      @authors.push(Author.new('Stephen', 'King'))
      @authors.push(Author.new('Nuri', 'Lacka'))
      @authors.push(Author.new('Mugisha', 'Samuel'))
      @authors.push(Author.new('Pedro', 'Guerreiro'))
      save_authors(@authors)
    end

    puts 'List of all games:'
    puts 'Database is empty. Add a game' if @games.empty?
    @games.each do |game|
      puts
      print "id: #{game.id} Name: '#{game.name}', Date: #{game.publish_date.strftime('%Y/%m/%d')}, "
      print "Multiplayer: #{game.multiplayer}, Last_played_at: #{game.last_played_at.strftime('%Y/%m/%d')}, "
      print "Author: '#{game.author.first_name} #{game.author.last_name}'"
    end
    puts ' '
  end

  # rubocop:disable Metrics/MethodLength
  def add_game
    if @authors.empty?
      @authors.push(Author.new('Stephen', 'King'))
      @authors.push(Author.new('Nuri', 'Lacka'))
      @authors.push(Author.new('Mugisha', 'Samuel'))
      @authors.push(Author.new('Pedro', 'Guerreiro'))
      save_authors(@authors)
    end

    puts 'Add a game'
    print 'Enter Game Name: '
    name = gets.chomp
    year = choose_year
    month = choose_month
    date = choose_day
    print 'Is game multiplayer? [Y/N]: '
    multiplayer_answer = gets.chomp.downcase
    multiplayer = true if multiplayer_answer == 'y'
    print 'Enter last played year: '
    year_last = gets.chomp.to_i
    print 'Enter last played month between 1-12: '
    month_last = gets.chomp.to_i
    print 'Enter last played day between 1-31: '
    day_last = gets.chomp.to_i
    puts 'Pick an index for the game author: '
    @authors.each_with_index { |author, index| puts "#{index}) name: #{author.first_name} #{author.last_name}"}
    author_index = gets.chomp.to_i
    new_game = Game.new(name, Time.new(year, month, date), multiplayer, Time.new(year_last, month_last, day_last))
    new_game.author = @authors[author_index]
    @games.push(new_game)
    save_games(@games)
    puts 'Game added'
  end
  # rubocop:enable Metrics/MethodLength
end
