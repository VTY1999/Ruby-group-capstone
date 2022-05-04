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
    options = {
      rray_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }

    data_format = JSON.generate(data, options)
    File.write("./preserve_data/#{file}.json", json_data)
  end

  def render_data
    path = "./preserve_data/#{file}.json"
    if File.exist?(path)
      File.write(path, '[]') if File.empty?(path)
      JSON.parse(File.read(path))
    else
      []
    end
  end
end
