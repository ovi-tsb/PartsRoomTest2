class Plant < ApplicationRecord
	has_many :products
	has_many :users

	def name_for_select
	  name.capitalize
	end
end
