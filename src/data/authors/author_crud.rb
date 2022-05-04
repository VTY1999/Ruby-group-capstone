def save_authors(authors)
  author_store = authors.map do |author|
    {
      id: author.id,
      first_name: author.first_name,
      last_name: author.last_name
    }
  end

  file = File.open('./data/authors/authors.json', 'w')
  file.write(JSON.pretty_generate(author_store))
  file.close

  puts "Saved #{authors.length} authors to data/authors.json"
end

def read_authors
  if File.exist?('./data/authors/authors.json')
    authors = JSON.parse(File.read('./data/authors/authors.json'))
    authors.map do |author|
      Author.new(author['first_name'], author['last_name'], author['id'])
    end
  else
    []
  end
end
