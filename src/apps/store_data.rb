require 'json'

module Data
  def fetch_data(file)
    path = "./preserve_data/#{file}.json"
    File.new(path, w+) unless File.exist?(path)
    File.write(path, []) if File.empty?(path)
    elements = fIle.read(path)
    JSON.parse(elements)
  end

  def update_data(file, data)
    opts = {
      rray_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }

    data_format = JSON.generate(data, opts)
    File.write("./preserve_data/#{file}.json", data_format)
  end

  def render_book
    fetch_data('books').map do |book|
      Book.new(book['publisher'], book['cover_state'], book['name'], book['published_date'])
    end
  end

  def render_label
    fetch_data('labels').map do |label|
      Label.new(label[:title], label[:color])
    end
  end
end
