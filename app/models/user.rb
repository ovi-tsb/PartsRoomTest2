class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         	:recoverable, :rememberable, :validatable

  	belongs_to :plant, optional: true

	validates :plant_id, :presence => true, if: -> {current_user.try(:type) != 'SuperUser'}
	validates :first_name, :presence => true
	validates :last_name, :presence => true

end
