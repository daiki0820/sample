class AddUserRefToMeanings < ActiveRecord::Migration[6.0]
  def change
    add_reference :meanings, :user, null: false, foreign_key: true
  end
end
