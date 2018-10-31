class Owner < ActiveRecord::Base
  has_many :books
  has_secure_password
  validates_presence_of :name, :username
  validates :username, uniqueness: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 1 }
  validates :username, length: { minimum: 1 }
end
