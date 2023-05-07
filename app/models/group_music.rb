class GroupMusic < ApplicationRecord
  belongs_to :group_playlist
  belongs_to :music
  belongs_to :user
end
