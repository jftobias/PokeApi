# frozen_string_literal: true

# This class is responsible to save pokemons into database
class SavedPokemons
  (1..150).each do |i|
    pocket_monster = PokemonService.new(i)
    name = pocket_monster.pokemon['name']
    stats_list = []
    pocket_monster.pokemon['stats'].each do |stats|
      stats_list.push(stats['stat']['name'])
    end
    types_list = []
    pocket_monster.pokemon['types'].each do |type|
      types_list.push(type['type']['name'])
    end
    description_list = []
    pocket_monster.description['flavor_text_entries'].each do |description|
      description_list.push(description['flavor_text']) if description['language']['name'] == 'en'
    end
    image_url = pocket_monster.pokemon['sprites']['other']['dream_world']['front_default']

    hash = {
      name: name,
      stats: stats_list,
      types: types_list,
      description: description_list,
      image_url: image_url
    }
    Pokemon.create hash
  end
end
