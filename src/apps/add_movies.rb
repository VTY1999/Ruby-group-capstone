require_relative '../movie'

module AddMovie
  def new_movie
    puts 'Please write in silent: '
    silent = gets.chomp

    puts 'Please write in date of publish [Enter date in format (yyyy-mm-dd)]'
    publish_date = gets.chomp

    Movie.new(silent, publish_date)
  end
end
