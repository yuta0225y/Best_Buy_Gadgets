# frozen_string_literal: true

require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory = ENV.fetch('AWS_BUCKET_NAME', nil) # バケット名
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID', nil), # 環境変数
    aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY', nil), # 環境変数
    region: 'ap-northeast-1', # リージョン
    path_style: true
  }
end
