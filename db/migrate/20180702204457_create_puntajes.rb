class CreatePuntajes < ActiveRecord::Migration
  def change
    create_table :puntajes do |t|
      t.integer :nivel_id
      t.integer :categoria_id
      t.integer :score

      t.timestamps

    end
  end
end
