require 'json'

module Data
  def fetch_data(file)
    path = "./data/#{file}.json"
    File.new(path, 'w+') unless File.exist?(path)
    File.write(path, []) if File.empty?(path)
    elements = File.read(path)
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
    File.write("./data/#{file}.json", data_format)
  end

  def render_data(file)
    path = "./data/#{file}.json"
    File.exist?(path)
    File.write(path, '[]') if File.empty?(path)
    JSON.parse(File.read(path))
  end
end
