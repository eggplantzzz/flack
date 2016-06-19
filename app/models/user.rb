class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true
end
