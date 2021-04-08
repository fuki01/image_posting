class ContextImgUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  
  version :gallery do
    # process :resize_to_fill => [200,250, '#000',"Center"]
    process :resize_and_pad => [300, 300, '#f5f5f5
    ', 'Center']
  end
  version :full do
    process :resize_and_pad => [500, 500, '#ffffff', 'Center']
  end
def store_dir
  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
end

def extension_white_list
     %w(jpg jpeg gif png)
end
end
