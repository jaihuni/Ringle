class CreateMusics < ActiveRecord::Migration[7.0]
  def change
    create_table :musics do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.integer :like, default: 0

      t.timestamps
    end
  end
end
