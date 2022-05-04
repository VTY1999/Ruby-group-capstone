def save_games(games)
  game_store = games.map do |game|
    {
      id: game.id,
      name: game.name,
      date: game.publish_date.to_i,
      multiplayer: game.multiplayer,
      last_played_at: game.last_played_at.to_i,
      archived: game.archived,
      author_id: game.author.id
    }
  end

  file = File.open('./data/games/games.json', 'w')
  file.write(JSON.pretty_generate(game_store))
  file.close

  puts "Saved #{games.length} games to data/games.json"
end

def read_games(authors)
  games_array = []
  if File.exist?('./data/games/games.json')
    games = JSON.parse(File.read('./data/games/games.json'))
    games.each do |game|
      game_item = Gane.new(game['name'], Time.at(game['date']), game['multiplayer'],
                          Time.at(game['last_played_at']), game['archived'], game['id'])

      authors.each do |author|
        game_item.author = author if author.id == game['author_id']
      end
      games_array << game_item
    end
    games_array
  else
    []
  end
end
