require './classes/book'
require './store_data/preserve_data'

module AppBook
  include PreserveData

  def inp(array)
    array_inputs = []
    array.each do |i|
      print "#{i}: "
      array_inputs.push(gets.chomp)
    end
    array_inputs
  end

  def list_all_books
    books = load_data('book')
    puts('No Books Avalibale') if books.empty?
    books.each_with_index do |book, index|
      puts(
        "#{index + 1}) Publisher: #{book['publisher']},
        Cover_state: #{book['cover_state']}, Publish_date: #{book['publish_date']}"
      )
    end
  end

  def add_book
    input = inp(%w[Publisher Cover-State Publish-Date])
    book = Book.new(input[0], input[1], input[2])
    book_obj = { publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date }
    update_data('book', book_obj)
    add_label
    puts('Book created Successfully')
  end

  def list_all_labels
    labels = load_data('label')
    puts('No Labels Avalibale') if labels.empty?
    labels.each_with_index do |label, index|
      puts(
        "#{index + 1}) Title: #{label['title']}, Color: #{label['color']}"
      )
    end
  end

  def add_label
    input = inp(['Label Title', 'Label Color'])
    label = Label.new(input[0], input[1])
    label_obj = { title: label.title, color: label.color }
    update_data('label', label_obj)
    puts('Label created Successfully')
  end
end