class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :discord_id, null: false, default: 0
      t.string :name, null: false
      t.text :image_url, null: false

      t.string :token, null: false
      t.string :refresh_token, null: false
      t.integer :expires_at, null: false
      t.timestamps

      t.index :discord_id, unique: true
    end
  end
end
