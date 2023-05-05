class Music < ApplicationRecord
  validates :title, presence: true
  validates :artist, presence: true
  validates :album, presence: true

end
