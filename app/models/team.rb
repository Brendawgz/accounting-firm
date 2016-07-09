class Team < ActiveRecord::Base
   has_many :staffs
   has_many :tasks, dependent: :destroy
   has_one :image
   validates :name, presence: true
   mount_uploader :picture, PictureUploader
   validate :picture_size
  
   private
  
   def picture_size
      if picture.size > 5.megabytes
          errors.add("Image should be less than 5mb")
      end
   end
end