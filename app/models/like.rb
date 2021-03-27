class Like < ApplicationRecord
  validates_uniqueness_of :exam_id, scope: :user_id
  belongs_to :user
  belongs_to :exam
end
