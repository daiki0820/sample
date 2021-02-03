class Meaning < ApplicationRecord
    belongs_to :word
    belongs_to :user
    validates :meaning, presence: true

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
end
