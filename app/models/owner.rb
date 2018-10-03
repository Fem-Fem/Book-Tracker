class Owner < ActiveRecord::Base
  has_many :books
  validates_presence_of :name, :username, :password
  has_secure_password
end
