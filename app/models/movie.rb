class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  validates :title, presence: true, uniqueness:true
  validates :overview, presence: true
  validates :rating, inclusion: { in: 0..10 }
end
