class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :currency
      t.string :address
      t.float :latitude
      t.float :longtitude

      t.timestamps
    end
  end
end
