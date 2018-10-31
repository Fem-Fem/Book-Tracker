class Backpack < ActiveRecord::Base
  belongs_to :owner
  has_many :books
  validates_presence_of :name
  validates :name, length: { minimum: 1 }
end
