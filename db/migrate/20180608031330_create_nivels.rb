class CreateNivels < ActiveRecord::Migration
  def change
    create_table :nivels do |t|
      t.integer :intended_year

      t.timestamps

    end
  end
end
