class Like < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  validates_uniqueness_of :exam_id, scope: :user_id
end
