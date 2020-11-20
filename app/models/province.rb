class Province < ApplicationRecord
  has_many :customers

  validates :name, :pst, presence: true
  validates :name, uniqueness: true
end
