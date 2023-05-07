class GroupPlaylist < ApplicationRecord
  belongs_to :group

  has_many :group_musics, dependent: :destroy
  has_many :musics, through: :group_music
end
