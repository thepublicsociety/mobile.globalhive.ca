class AddFeatureTitleToItems < ActiveRecord::Migration
  def change
    add_column :items, :feature_title, :string
  end
end
