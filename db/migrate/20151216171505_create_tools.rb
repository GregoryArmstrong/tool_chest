class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.text :name
      t.text :use

      t.timestamps null: false
    end
  end
end
