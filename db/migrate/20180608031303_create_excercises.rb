class CreateExcercises < ActiveRecord::Migration
  def change
    create_table :excercises do |t|
      t.integer :contenido_id
      t.string :skill
      t.integer :dificultad
      t.string :imagen
      t.text :question
      t.integer :indicator_id

      t.timestamps

    end
  end
end
