# frozen_string_literal: true

class Board < ApplicationRecord
  validates :body, presence: true, length: { maximum: 65_535 }
  acts_as_taggable_on :tags # タグ機能を追加
  mount_uploader :board_image, BoardImageUploader
  belongs_to :user
end
