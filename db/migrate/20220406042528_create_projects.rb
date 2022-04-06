class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.string :target_amount, null: false
      t.string :end_date, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.integer :posting_status, null: false, default: 0

      t.timestamps
    end
  end
end
