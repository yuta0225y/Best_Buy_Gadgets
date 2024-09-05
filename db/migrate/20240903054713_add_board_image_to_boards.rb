# frozen_string_literal: true

class AddBoardImageToBoards < ActiveRecord::Migration[7.1]
  def change
    add_column :boards, :board_image, :string
  end
end
