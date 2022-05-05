require 'date'
require_relative './item'

class Movie < Item
  attr_accessor :silent

  def initialize(silent, publish_date)
    super(publish_date, archived)
    @silent = silent
  end

  def can_be_archived?
    return true if super && @silent
  end

  private :can_be_archived?
end
