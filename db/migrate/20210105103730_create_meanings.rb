class CreateMeanings < ActiveRecord::Migration[6.0]
  def change
    create_table :meanings do |t|
      t.string :meaning

      t.timestamps
    end
  end
end
