class CreatePosition < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.integer :x, default: 0
      t.integer :y, default: 0
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
