class Match < ActiveRecord::Base
  belongs_to :user_1, :class_name => "User", :foreign_key => "user_1"
  belongs_to :user_2, :class_name => "User", :foreign_key => "user_2"
  validates :user_1, :user_2, presence: true
end