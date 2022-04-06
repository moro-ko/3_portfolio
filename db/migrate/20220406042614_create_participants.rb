class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.integer :user_id, null: false
      t.integer :project_id, null: false
      t.text :reason, null: false
      t.string :contact_address, null: false
      t.text :comment, null: false
      t.integer :approval_status, null: false, default: 0

      t.timestamps
    end
  end
end
