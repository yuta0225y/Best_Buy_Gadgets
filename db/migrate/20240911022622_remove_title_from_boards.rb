class RemoveTitleFromBoards < ActiveRecord::Migration[7.1]
  def change
    remove_column :boards, :title, :string
  end
end
