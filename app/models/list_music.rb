class ListMusic < ApplicationRecord
  belongs_to :playlists
  belongs_to :musics
end
