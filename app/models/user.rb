class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :birth_date, presence: true
  has_many  :likes, dependent: :destroy
  def self.guest
      find_or_create_by!(email: 'test@test.com') do |user|
        user.password = SecureRandom.urlsafe_base64
        user.name = "ゲスト"
        user.birth_date ="1999-04-02"
    end
  end
end
