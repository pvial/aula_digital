class CreateSeccions < ActiveRecord::Migration
  def change
    create_table :seccions do |t|
      t.integer :contenido_id
      t.integer :test_id
      t.integer :numero_ejercicios

      t.timestamps

    end
  end
end
