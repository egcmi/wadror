class AddBlockedFlagToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :blocked, :boolean
  end
end
