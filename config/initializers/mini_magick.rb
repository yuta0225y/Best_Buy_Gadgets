MiniMagick.configure do |config|
  config.cli = :imagemagick
  config.cli_path = "/opt/homebrew/bin" # 実際のパスに置き換えました
end
