require_relative './apps/store_data'
require_relative './game'
require_relative './author'
require_relative './game_date_template'

module GameListMethods
  include Data
  include GameDateTemplate

  def list_all_authors
    authors = render_data('authors')
    authors.each do |author|
      puts "id: #{author['id']} name: '#{author['first_name']} #{author['last_name']}'"
    end
  end

  def list_of_games
    all_games = render_data('games')
    puts 'List of all games:'
    puts 'Database is empty. Add a game' if all_games.empty?
    all_games.each do |game|
      puts
      print " Name: '#{game['name']}', Author: '#{game['author']}', Publish_date: #{game['date']} "
      print " Multiplayer: #{game['multiplayer']}, Last_played_at: #{game['last_played_at']} "
      # print "Author: '#{game['author.first_name']} #{game['author.last_name']}'"
    end
    puts ' '
  end

  def add_author
    my_authors = fetch_data('authors')
    puts 'Add author'
    input = inp(%w[First-Name Last-Name Id])
    p input
    author = Author.new(input[0], input[1], input[2])
    author_obj = { first_name: author.first_name, last_name: author.last_name, id: author.id }
    my_authors.push(author_obj)
    update_data('authors', my_authors)
    puts 'Author created Successfully'
    author
  end

  # rubocop:disable Metrics/MethodLength
  def add_game
    my_games = fetch_data('games')
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
    new_game = Game.new(name, Time.new(year, month, date), multiplayer, Time.new(year_last, month_last, day_last))
    game_author = add_author
    game_obj = {
      name: new_game.name,
      date: new_game.publish_date,
      multiplayer: new_game.multiplayer,
      last_played_at: new_game.last_played_at,
      archived: new_game.archived,
      author: "#{game_author.first_name} #{game_author.last_name} "
    }
    my_games.push(game_obj)
    update_data('games', my_games)
    puts 'Game added'
  end
  # rubocop:enable Metrics/MethodLength
end
