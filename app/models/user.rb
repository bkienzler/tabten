class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :ranking, uniqueness: true
  
  include UserUtil
  
  def level
    triangle_numbers(self.ranking).size
  end 
  
  def challenge_range
    Array(self.ranking - (self.level - 1) .. self.ranking - 1)
  end
end
