class Upload < ActiveRecord::Base
  attr_accessible :content_type, :file, :name, :path, :size, :user_id
  belongs_to :user, class_name: '::User', foreign_key: :user_id
  
  # CarrierWave / állomány attribútumok
  mount_uploader :file, Uploader

  before_save :update_asset_attributes
  
  private
  
  def update_asset_attributes
    if file.present? && file_changed?
      self.content_type = file.file.content_type
      self.size = file.file.size
      self.name = file.file.original_filename
    end
  end  
end
