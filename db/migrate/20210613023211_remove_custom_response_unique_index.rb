class RemoveCustomResponseUniqueIndex < ActiveRecord::Migration[6.1]
  def change
    remove_index :custom_responses, :key
    add_index  :custom_responses, [:key, :response], unique: true
  end
end
