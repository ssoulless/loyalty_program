class Transaction < ActiveRecord::Base
	belongs_to :client
	belongs_to :store

	monetize :total_cents
end
