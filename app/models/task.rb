class Task < ActiveRecord::Base
   belongs_to :client
   belongs_to :team
   has_many :subtasks, dependent: :destroy
   validates :name, presence: true
   validates_inclusion_of :paid, :in => [true, false]
   validates :charge, presence: true
   validates :category, presence: true
   validates :deadline, presence: true
   validates :team_id, presence: true
   validates :client_id, presence: true
   
   def self.search(param)
    return Task.none if param.blank?
    
    param.strip!
    param.downcase!
    (name_matches(param)).uniq
  end
  
  def self.name_matches(param)
    matches('name', param)
  end
  
  def self.matches(field_name, param)
    where("lower(#{field_name}) like ?", "%#{param}%")
  end
end