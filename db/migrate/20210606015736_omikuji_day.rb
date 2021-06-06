class OmikujiDay < ActiveRecord::Migration[6.1]
  def change
    create_table :day_omikujis do |t|
      t.string :name
      t.integer :discord_id, null: false, default: 0

      t.timestamps
    end
  end
end
