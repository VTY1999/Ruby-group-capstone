require_relative './src/apps/book_app'
require_relative './src/game_list_methods'

class Main
  include AppBook
  include GameListMethods

  def list_of_options
    puts
    puts '1 - List all books'
    puts '2 - List all movies'
    puts '3 - List all music albums'
    puts '4 - List of games'
    puts '5 - List all genres'
    puts '6 - List all labels'
    puts '7 - List all authors'
    puts '8 - List all sources'
    puts '9 - Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts '13 - Exit'
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength

  def entry_console(number)
    case number
    when 1
      list_all_books
    when 2
      list_all_movies
    when 3
      list_all_muics_albums
    when 4
      list_of_games
    when 5
      list_all_genres
    when 6
      list_all_labels
    when 7
      list_all_authors
    when 8
      list_all_sources
    when 9
      add_book
    when 10
      add_music_album
    when 11
      add_movie
    when 12
      add_game
    when 13
      exit
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength
end

loop do
  app = Main.new
  app.list_of_options
  x = gets.chomp.to_i
  app.entry_console(x)
end
