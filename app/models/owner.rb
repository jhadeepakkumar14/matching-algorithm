class Owner < ApplicationRecord
  has_many :renovation_projects, dependent: :destroy
end
