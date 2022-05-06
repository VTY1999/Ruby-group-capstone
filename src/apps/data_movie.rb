require 'json'
require_relative '../movie'
require_relative '../source'

module PreserveMovie
  def load_movie
    data = []
    file = './data/movie.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |movie|
        data.push(Movie.new(movie['silent'], movie['publish_date']))
      end
    else
      File.write(file, [])
    end
    data
  end

  def load_source
    data = []
    file = './data/source.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |source|
        data.push(Source.new(source['name']))
      end
    else
      File.write(file, [])
    end
    data
  end

  def create_movie
    data = []
    @movies.each do |movie|
      data.push({ silent: movie.silent, publish_date: movie.publish_date })
    end
    File.write('./data/movie.json', JSON.generate(data))
  end
end
