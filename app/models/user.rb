class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  validates :ranking, :name, uniqueness: true
  validates :ranking, :name, :email, presence: true
  validates_format_of :name, with: /\A[-a-z]+\z/, message: "must be lowercase alphanumerics only"
  validates_length_of :name, maximum: 32, message: "exceeds maximum of 32 characters"
  validates_exclusion_of :name, in: ['www', 'mail', 'ftp'], message: "is not available"

  include UserUtil

  def level
    triangle_numbers(self.ranking).size
  end 

  def challenge_range
    Array(self.ranking - (self.level - 1) .. self.ranking - 1)
  end
end
