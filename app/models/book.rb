class Book < ActiveRecord::Base
  belongs_to :owner
  validates_presence_of :title, :author, :genre, :summary
  validates :summary, length: { minimum: 50 }
end
