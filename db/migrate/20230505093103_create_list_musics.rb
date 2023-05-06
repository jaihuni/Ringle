class CreateListMusics < ActiveRecord::Migration[7.0]
  def change
    create_table :list_musics do |t|
      t.references :playlists, null: false, foreign_key: true
      t.references :musics, null: false, foreign_key: true

      t.timestamps
    end
  end
end
