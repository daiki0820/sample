class Word < ApplicationRecord
#アソシエーション(1:多)
belongs_to :user
#アソシエーション(1:多)
has_many :meanings, dependent: :destroy
validates :word, :meaning, :furigana, presence: true
end
