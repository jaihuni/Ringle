class CreateGroupPlaylists < ActiveRecord::Migration[7.0]
  def change
    create_table :group_playlists do |t|
      t.string :name
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
