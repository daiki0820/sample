class AddWordRefToMeanings < ActiveRecord::Migration[6.0]
  def change
    add_reference :meanings, :word, null: false, foreign_key: true
  end
end
