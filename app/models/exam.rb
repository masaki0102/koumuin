class Exam < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :government
  has_many   :likes

  validates :date, presence: true
  validates :age, presence: true
  validates :category_id, numericality: { other_than: 1 }
end
