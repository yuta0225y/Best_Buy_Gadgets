# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 65_535 }

  belongs_to :user
  belongs_to :board
end
