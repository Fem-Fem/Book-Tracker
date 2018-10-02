class Book < ActiveRecord::Base
  belongs_to :owner
  validates_presence_of :title, :author, :genre, :summary
end
