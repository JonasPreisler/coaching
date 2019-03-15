class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :tutor_id
      t.integer :account_id
      t.text :comment
      t.integer :rating

      t.timestamps
    end
  end
end
