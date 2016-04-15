class CreateCatagories < ActiveRecord::Migration
  def change
    create_table :catagories do |t|
    	t.string :name
    	t.integer :no_of_copies

      t.timestamps null: false
    end
  end
end
