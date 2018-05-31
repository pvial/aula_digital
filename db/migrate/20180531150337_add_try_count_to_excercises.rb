class AddTryCountToExcercises < ActiveRecord::Migration[5.0]
  def change
    add_column :excercises, :tries_count, :integer
  end
end
