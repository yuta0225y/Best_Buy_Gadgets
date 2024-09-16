class Board < ApplicationRecord
  validates :body, presence: true, length: { maximum: 65_535 }
  acts_as_taggable_on :tags
  mount_uploader :board_image, BoardImageUploader
  belongs_to :user
end
