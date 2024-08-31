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

  def search_gadgets
    keyword = params[:keyword]
    items = RakutenWebService::Ichiba::Item.search(keyword: keyword, genreId: '100240', hits: 10) # 100240はガジェットのジャンルID
    
    @gadgets = items.map do |item|
      {
        title: item['itemName'],
        image_url: item['mediumImageUrls'].first['imageUrl'],
        item_url: item['itemUrl'],
        price: item['itemPrice']
      }
    end
  
    render json: @gadgets
  end
end

private

def board_params
  params.require(:board).permit(:title, :body)
end