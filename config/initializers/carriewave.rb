require 'carrierwave/storage/abstract' 
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

# 画像の保存先をS3にする
CarrierWave.configure do |config| # CarrierWaveの設定
  config.storage :fog # ストレージをfogに指定
  config.fog_provider = 'fog/aws' # 追加
  config.fog_directory = ENV.fetch('AWS_BUCKET_NAME', nil) # バケット名
  config.fog_credentials = {  # 認証情報
    provider: 'AWS', # プロバイダー
    aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID', nil), # 環境変数
    aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY', nil), # 環境変数
    region: 'ap-northeast-1', # リージョン
    path_style: true # 追加
  }
end
