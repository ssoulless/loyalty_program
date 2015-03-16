class Client < ActiveRecord::Base
	has_many :memberships
	has_many :stores, through: :memberships
	has_many :transactions

	def addpoints! points_awarded
		if self.points.nil?
			self.points = 0
		end
		self.points = self.points + points_awarded
		self.save!
	end
end
