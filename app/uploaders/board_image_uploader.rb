class BoardImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick # 画像サイズ調整のためにMiniMagickをinclude

  if Rails.env.production? # 本番環境の場合はS3に保存
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}" # 画像の保存先の指定
  end

  def default_url
    ActionController::Base.helpers.asset_path('board_placeholder.png')  # 画像がない場合のデフォルト画像
  end

    process resize_to_fit: [400, 400] # 画像サイズの上限を400x400にする

  def extension_allowlist # 画像の拡張子を許可
    %w[jpg jpeg gif png]
  end
end