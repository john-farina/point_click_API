class CreateUserData < ActiveRecord::Migration[7.0]
  def change
    create_table :user_data do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :username
      t.boolean :online, default: true
      t.string :scene
      t.integer :x, default: 0
      t.integer :y, default: 0

      t.timestamps
    end
  end
end
