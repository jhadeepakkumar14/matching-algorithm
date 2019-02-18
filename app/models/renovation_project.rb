class RenovationProject < ApplicationRecord
  belongs_to :owner  
  has_many :matching_gcs
  has_many :general_contractors, through: :matching_gcs
end
