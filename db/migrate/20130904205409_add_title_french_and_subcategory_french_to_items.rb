class AddTitleFrenchAndSubcategoryFrenchToItems < ActiveRecord::Migration
  def change
    add_column :items, :title_french, :string
    add_column :items, :subcategory_french, :string
  end
end
