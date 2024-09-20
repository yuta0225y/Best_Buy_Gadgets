class BoardImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path('board_placeholder.png')
  end

  # メイン画像のリサイズは不要なのでコメントアウト
  # process resize_to_fit: [400, 400]

  # リサイズ用のバージョンを定義
  version :resized do
    process resize_to_fit: [400, 400]
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end
end
