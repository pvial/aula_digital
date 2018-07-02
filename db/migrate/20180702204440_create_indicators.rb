class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.integer :objetivo_id
      t.text :descripcion
      t.integer :numeral

      t.timestamps

    end
  end
end
