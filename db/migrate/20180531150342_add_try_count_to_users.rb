class AddTryCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tries_count, :integer
  end
end
