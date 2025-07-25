class TopAlbum < ApplicationRecord
  belongs_to :artist
  validates :title, uniqueness: true
end
