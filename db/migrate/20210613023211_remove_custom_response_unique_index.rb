class RemoveCustomResponseUniqueIndex < ActiveRecord::Migration[6.1]
  def change
    remove_index :custom_responses, :key
  end
end
