class Team < ActiveRecord::Base
   has_many :staffs
   has_many :tasks, dependent: :destroy
   has_one :image
   validates :name, presence: true
   mount_uploader :picture, PictureUploader
   validate :picture_size
  
  def self.search(param)
    return Staff.none if param.blank?
    
    param.strip!
    param.downcase!
    (name_matches(param) + email_matches(param)).uniq
  end
  
  def self.name_matches(param)
    matches('name', param)
  end

  def self.email_matches(param)
    matches('email', param)
  end
  
  def self.matches(field_name, param)
    where("lower(#{field_name}) like ?", "%#{param}%")
  end
  
   private
  
   def picture_size
      if picture.size > 5.megabytes
          errors.add("Image should be less than 5mb")
      end
   end
end