class User < ApplicationRecord
  validates :name, presence: true

  has_many :playlists, dependent: :destroy

  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_user
end
