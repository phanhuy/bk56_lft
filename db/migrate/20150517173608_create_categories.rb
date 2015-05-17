class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :CategoryName
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
