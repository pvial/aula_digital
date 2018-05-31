class CreateObjetivos < ActiveRecord::Migration
  def change
    create_table :objetivos do |t|
      t.integer :pre_objetivo_id
      t.integer :next_objetivo_id
      t.integer :eje_id
      t.text :description
      t.integer :nivel_id

      t.timestamps

    end
  end
end
