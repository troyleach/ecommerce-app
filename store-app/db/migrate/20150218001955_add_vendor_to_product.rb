class AddVendorToProduct < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.change   :vendor, :string
    end
  end
end
