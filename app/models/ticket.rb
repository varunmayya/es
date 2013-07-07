class Ticket < ActiveRecord::Base
  belongs_to :event
  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :quantity
  validates_numericality_of :price, greater_than: 0
  validates_numericality_of :quantity, greater_than: -1
end
