class UsePart < ApplicationRecord
  belongs_to :product, optional: true
end
