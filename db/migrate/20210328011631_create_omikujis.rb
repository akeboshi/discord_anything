class CreateOmikujis < ActiveRecord::Migration[6.1]
  def change
    create_table :omikujis do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
