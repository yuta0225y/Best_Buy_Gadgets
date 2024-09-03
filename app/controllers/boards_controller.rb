class BoardsController < ApplicationController
  def index
    @boards = Board.includes(:user)
  end
  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, success: t('defaults.flash_message.created', item: Board.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Board.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end
end

private

def board_params
  params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
end