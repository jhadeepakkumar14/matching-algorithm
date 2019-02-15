class Contractor < User
  has_many :general_contractors, dependent: :destroy
end
