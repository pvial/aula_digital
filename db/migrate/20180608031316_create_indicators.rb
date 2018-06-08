class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.integer :pre_indicator_id
      t.integer :next_indicator_id
      t.integer :objetivo_id
      t.text :description

      t.timestamps

    end
  end
end
