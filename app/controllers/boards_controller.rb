# frozen_string_literal: true

class BoardsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @boards = Board.includes(:user)
  
    if params[:tag]
      @boards = Board.tagged_with(params[:tag])
    else
      @boards = Board.all
    end
  
    @boards = @boards.order(created_at: :desc)  # 最後にorderを適用する
  end
  
  def show
    @board = Board.find(params[:id])
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
  params.require(:board).permit(:title, :body, :board_image, :board_image_cache, :tag_list)
end
