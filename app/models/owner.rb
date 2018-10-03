class Owner < ActiveRecord::Base
  has_many :books
  has_secure_password
  validates_presence_of :name, :username, :password
end
