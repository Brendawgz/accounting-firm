module TeamsHelper
	def team_staffs_no_tasks?(team)
    team.staffs.each do |staff|
      if !staff.subtasks.empty?
        return false
      end
      return true
    end
  end
end
