class Owner < User
  has_many :renovation_projects, dependent: :destroy
end
