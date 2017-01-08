class CreateVms < ActiveRecord::Migration[5.0]
  def change
    create_table :vms do |t|
      t.string :name
      t.string :ip
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :vms, [:user_id, :created_at]
  end
end
