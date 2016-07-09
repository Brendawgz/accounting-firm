class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tasks, dependent: :destroy
  has_one :image
  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :encrypted_password, confirmation: true
  validates :encrypted_password_confirmation, presence: true
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  private
  
  def picture_size
      if picture.size > 5.megabytes
          errors.add("Image should be less than 5mb")
      end
  end
end
