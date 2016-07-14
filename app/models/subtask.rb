class Subtask < ActiveRecord::Base
   belongs_to :task
   belongs_to :staff
   validates :name, presence: true
   validates :category, presence: true
   validates :deadline, presence: true
   validates :task_id, presence: true
   validates :staff_id, presence: true
   
   def self.search(param)
    return Subtask.none if param.blank?
    
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