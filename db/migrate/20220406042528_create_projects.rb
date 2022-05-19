class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.integer :target_amount, null: false
      t.date :end_date, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.integer :area, null: false, default: 0
      t.integer :posting_status, null: false, default: 0

      t.timestamps
    end
  end
end
