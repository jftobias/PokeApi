class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :description
      t.string :types
      t.string :stats
      t.string :image_url

      t.timestamps
    end
  end
end
