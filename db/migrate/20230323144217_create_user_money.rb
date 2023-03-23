class CreateUserMoney < ActiveRecord::Migration[7.0]
  def change
    create_table :user_moneys do |t|
      t.integer :quarters, default: 0
      t.integer :tickets, default: 0
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
