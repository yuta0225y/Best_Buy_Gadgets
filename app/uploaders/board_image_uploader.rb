class BoardImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path('board_placeholder.png')
  end

  # 画像のリサイズ設定を確認
  version :thumb do
    process resize_to_fill: [400, 400] # 幅400px、高さ300pxにリサイズ
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  # filenameの設定は省略しておきます。
end