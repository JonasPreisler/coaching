class ActiveHour < ApplicationRecord
	has_one :tutor

	def active_time
		start.strftime('%a %d.%m.%Y') + ' - ' + self.end.strftime('%a %d.%m.%Y')
	end

end
