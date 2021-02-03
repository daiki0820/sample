class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

  #アソシエーション(1:多)
  has_many :words
  has_many :meanings
  has_many :likes, dependent: :destroy
  has_many :liked_meanings, through: :likes, source: :meaning

  def already_liked?(meaning)
    self.likes.exists?(meaning_id: meaning.id)
  end
end
