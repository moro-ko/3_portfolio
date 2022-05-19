class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.integer :user_id, null: false
      t.integer :project_id, null: false
      t.string :name, null: false
      t.text :message, null:false

      t.timestamps
    end
  end
end
