class CreateColegios < ActiveRecord::Migration
  def change
    create_table :colegios do |t|
      t.text :nombre

      t.timestamps

    end
  end
end
