class Image < ActiveRecord::Base
  belongs_to :staff
  belongs_to :client
  belongs_to :team
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  private
  
  def picture_size
      if picture.size > 5.megabytes
          errors.add("Image should be less than 5mb")
      end
  end
end
