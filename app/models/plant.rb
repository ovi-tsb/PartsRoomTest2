class Plant < ApplicationRecord
	has_many :products

	def name_for_select
	  name.capitalize
	end
end
