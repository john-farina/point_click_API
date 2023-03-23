class CreateUserInventory < ActiveRecord::Migration[7.0]
  def change
    create_table :user_inventories do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.boolean :glasses_3D, default: false
      t.boolean :chain_gold, default: false

      t.timestamps
    end
  end
end
