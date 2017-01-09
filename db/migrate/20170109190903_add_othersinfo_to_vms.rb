class AddOthersinfoToVms < ActiveRecord::Migration[5.0]
  def change
    add_column :vms, :config, :string
    add_column :vms, :cpu, :integer, default:2
    add_column :vms, :ram, :integer, default:1024
    add_column :vms, :hdd, :integer, default:5
  end
end
