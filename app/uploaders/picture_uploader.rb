# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [300, 300]

  storage :file

  version :small_thumb, :from_version => :thumb do
    process resize_to_fill: [20, 20]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def default_url
    "/images/fallback/" + [version_name, "logo.jpg"].compact.join('_')
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
