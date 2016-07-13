class Task < ActiveRecord::Base
   belongs_to :client
   belongs_to :team
   validates :name, presence: true
   validates_inclusion_of :paid, :in => [true, false]
   validates :charge, presence: true
   validates :category, presence: true
   #validates :deadline, presence: true
   validates :completion, presence: true
   validates :team_id, presence: true
   validates :client_id, presence: true
end