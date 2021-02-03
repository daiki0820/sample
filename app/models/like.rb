class Like < ApplicationRecord
  belongs_to :meaning
  belongs_to :user

  validates_uniqueness_of :meaning_id, scope: :user_id
end
