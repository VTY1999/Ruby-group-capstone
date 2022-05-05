require 'json'
require_relative '../movie'
require_relative './add_movies'
require_relative './data_movie'

module AppMovie
  include AddMovie
  include PreserveMovie

  def initialize
    @movies = load_movie
    @source = load_source
  end

  def list_all_movies
    puts 'There are no movies available' if @movies.empty?
    @movies.each do |movie|
      puts "Silent: #{movie.silent}, Date of Publish: #{movie.publish_date}"
    end
  end

  def add_movie
    @movies << new_movie
    puts 'Movie Created'
  end

  def save_data
    create_movie
  end

  def list_all_sources
    puts 'There are no sources available' if @source.empty?
    @source.each do |source|
      puts "Name: #{source.name}"
    end
  end
end
