class CreateCustomResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :custom_responses do |t|
      t.string :key, null: false, default: ''
      t.text :response, null: false, default: ''
      t.references :user, null: false, foreign_key: true

      t.timestamps
      t.index :key, unique: true
    end
  end
end
