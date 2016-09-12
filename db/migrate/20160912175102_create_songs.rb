class CreateSongs < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :songs, id: :uuid do |t|
      t.timestamps null: false
      t.string :name, null: false
      t.integer :duration
      t.string :album_title
    end
  end
end
