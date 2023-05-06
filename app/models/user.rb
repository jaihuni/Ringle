class User < ApplicationRecord
  validates :name, presence: true

  has_many :playlists, dependent: :destroy

  has_one :group_user, dependent: :destroy
  has_many :groups, :through => :group_users
end
