class Group < ApplicationRecord
  validates :name, presence: true

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_user

  has_many :group_playlists, dependent: :destroy
end
