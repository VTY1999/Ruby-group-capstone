require './src/movie'
require 'date'

describe 'Testing Movie methods' do
  it 'should be archived if it\'s silent' do
    movie = Movie.new(silent: true, published_date: DateTime.parse('2022-10-16'))
    movie.move_to_archive
    expect(movie.move_to_archive).to be true
  end
end
