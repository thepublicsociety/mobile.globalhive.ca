class AddNameFrenchAndBodyFrenchToItems < ActiveRecord::Migration
  def change
    add_column :items, :name_french, :string
    add_column :items, :body_french, :text
  end
end
