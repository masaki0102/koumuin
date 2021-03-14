class Exam < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :government

  validates :date, :age, presence: true
  validates :category_id, numericality: { other_than: 1 }
end
