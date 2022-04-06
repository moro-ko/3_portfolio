class CreateBackers < ActiveRecord::Migration[6.1]
  def change
    create_table :backers do |t|
      t.integer :user_id, null: false
      t.integer :project_id, null: false
      t.string :support_amount, null: false
      t.text :comment, null:false

      t.timestamps
    end
  end
end
