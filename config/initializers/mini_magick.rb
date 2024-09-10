MiniMagick.configure do |config|
  config.cli = :imagemagick
  config.tempfile = "#{Dir.home}/rails/tmp/"
end