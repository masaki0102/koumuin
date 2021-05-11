class Government < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates  :name
    validates  :prefecture
    validates  :image
  end
  belongs_to :prefecture
  has_one_attached :image
  validates :prefecture_id, numericality: { other_than: 1 }
  has_many :exams, dependent: :destroy
end
