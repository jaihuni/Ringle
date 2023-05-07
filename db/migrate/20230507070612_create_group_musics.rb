class CreateGroupMusics < ActiveRecord::Migration[7.0]
  def change
    create_table :group_musics do |t|
      t.references :group_playlist, null: false, foreign_key: true
      t.references :music, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
