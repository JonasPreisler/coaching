class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :file
      t.integer :tutor_id

      t.timestamps
    end
  end
end
