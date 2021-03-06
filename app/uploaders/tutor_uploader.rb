class TutorUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  version :profile_picture do
    process resize_to_fit: [600, 600]
    process resize_to_fill: [600, 600]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
