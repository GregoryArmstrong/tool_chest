class AddForeignKeyToTools < ActiveRecord::Migration
  def change
    add_reference :tools, :user, index: true
    add_foreign_key :tools, :users
  end
end
