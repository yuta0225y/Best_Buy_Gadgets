class User < ApplicationRecord
  authenticates_with_sorcery!

  # ユーザー名は10文字以下
  validates :name, presence: true, length: { maximum: 10 }

  # パスワードは4文字以上8文字以下
  validates :password, length: { in: 4..8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true
  has_many :boards, dependent: :destroy
end

