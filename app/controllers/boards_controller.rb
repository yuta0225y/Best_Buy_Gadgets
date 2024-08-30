class BoardsController < ApplicationController
  def index
    @boards = Board.includes(:user)
  end
end
