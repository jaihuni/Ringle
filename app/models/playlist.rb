class Playlist < ApplicationRecord
  validates :title, presence: true
  belongs_to :user

  has_many :list_musics, dependent: :destroy
  has_many :musics, through:list_musics
end
