class BoardsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @boards = Board.includes(:user)
    if params[:tag]
      @boards = Board.tagged_with(params[:tag])
    else
      @boards = Board.all
    end
  
    @boards = @boards.order(created_at: :desc) 
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

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to boards_path, success: t('defaults.flash_message.updated', item: Board.model_name.human) 
    else
      flash.now[:danger] = t('defaults.flash_message.not_updated', item: Board.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy!
    redirect_to boards_path, success: t('defaults.flash_message.deleted', item: Board.model_name.human), status: :see_other
  end

  private

  def board_params
    params.require(:board).permit(:body, :board_image, :board_image_cache, :tag_list)
  end
end
