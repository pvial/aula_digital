class CreateTries < ActiveRecord::Migration
  def change
    create_table :tries do |t|
      t.integer :user_id
      t.integer :excercise_id
      t.string :user_answer
      t.boolean :correct
      t.boolean :active

      t.timestamps

    end
  end
end
