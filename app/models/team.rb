class Team < ActiveRecord::Base
   has_many :staffs
   has_many :tasks, dependent: :destroy
   validates :name, presence: true
end