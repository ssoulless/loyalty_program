class Store < ActiveRecord::Base
	has_many :memberships
	has_many :clients, through: :memberships
	has_many :transactions
end
