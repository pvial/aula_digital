class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categoria do |t|
      t.text :descripcion
      t.integer :eje_id

      t.timestamps

    end
  end
end
