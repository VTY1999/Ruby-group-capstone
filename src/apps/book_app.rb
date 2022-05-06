require_relative '../book'
require_relative '../label'
require_relative './store_data'

module AppBook
  include Data

  def inp(array)
    array_inputs = []
    array.each do |i|
      print "#{i}: "
      array_inputs.push(gets.chomp)
    end
    array_inputs
  end

  def list_all_books
    books = render_data('books')
    puts('There is no book yet') if books.empty?
    books.each_with_index do |book, index|
      puts(
        "#{index + 1}) Publisher: #{book['publisher']},
        Cover_state: #{book['cover_state']}, Publish_date: #{book['publish_date']}"
      )
    end
  end

  def add_book
    stored_books = fetch_data('books')
    input = inp(%w[Publisher Cover-State Publish-Date])
    book = Book.new(input[0], input[1], input[2])
    book_obj = { publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date }
    add_label
    stored_books.push(book_obj)
    update_data('books', stored_books)
    puts('Book created Successfully')
  end

  def list_all_labels
    labels = render_data('labels')
    puts('There is no lable yet') if labels.empty?
    labels.each_with_index do |label, index|
      puts(
        "#{index + 1}) Title: #{label['title']}, Color: #{label['color']}"
      )
    end
  end

  def add_label
    input = inp(['Label Title', 'Label Color'])
    stored_label = fetch_data('labels')
    label = Label.new(input[0], input[1])
    label_obj = { title: label.title, color: label.color }
    stored_label.push(label_obj)
    update_data('labels', stored_label)
    puts('Label created Successfully')
  end
end
