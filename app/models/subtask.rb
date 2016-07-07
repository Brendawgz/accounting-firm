class Subtask < ActiveRecord::Base
   belongs_to :task
   belongs_to :staff
   validates :name, presence: true
   validates :type, presence: true
   validates :deadline, presence: true
   validates :task_id, presence: true
   validates :staff_id, presence: true
end