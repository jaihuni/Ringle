class Music < ApplicationRecord
  validates :title, presence: true
  validates :artist, presence: true
  validates :album, presence: true

  has_many :list_musics, dependent: :destroy
  has_many :group_musics, dependent: :destroy
end
