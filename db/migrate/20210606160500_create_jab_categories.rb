class CreateJabCategories < ActiveRecord::Migration[6.1]
  def change
    #this table will only have category and article IDs
      create_table :jab_categories do |t|
        t.integer :jab_id
        t.integer :category_id
      end
    end
  end
