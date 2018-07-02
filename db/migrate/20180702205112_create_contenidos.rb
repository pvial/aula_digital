class CreateContenidos < ActiveRecord::Migration
  def change
    create_table :contenidos do |t|
      t.text :nombre
      t.integer :anterior
      t.integer :siguiente
      t.integer :categoria_id

      t.timestamps

    end
  end
end
