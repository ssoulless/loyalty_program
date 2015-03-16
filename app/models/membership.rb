class Membership < ActiveRecord::Base
	belongs_to :client
	belongs_to :store

	def addpoints! points_awarded
		if self.points.nil?
			self.points = 0
		end
		self.points = self.points + points_awarded
		self.save!
	end
end
