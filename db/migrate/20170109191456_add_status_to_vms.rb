class AddStatusToVms < ActiveRecord::Migration[5.0]
  def change
    add_column :vms, :status, :string
  end
end
