class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
    
  def is_owner?
    user_type == "owner" ? true : false  
  end
    
  def is_contractor?
    user_type == "general_contractor" ? true : false
  end
    
  def is_admin?
    user_type == "admin" ? true : false
  end
end
