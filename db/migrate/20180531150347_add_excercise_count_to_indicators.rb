class AddExcerciseCountToIndicators < ActiveRecord::Migration[5.0]
  def change
    add_column :indicators, :excercises_count, :integer
  end
end
