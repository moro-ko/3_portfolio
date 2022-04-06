class CreateReturns < ActiveRecord::Migration[6.1]
  def change
    create_table :returns do |t|
      t.integer :project_id, null: false
      t.text :b_contents, null: false
      t.text :p_contents, null: false
      t.integer :p_amount, null: false

      t.timestamps
    end
  end
end
