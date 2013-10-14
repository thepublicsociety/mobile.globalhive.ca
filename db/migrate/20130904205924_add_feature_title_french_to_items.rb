class AddFeatureTitleFrenchToItems < ActiveRecord::Migration
  def change
    add_column :items, :feature_title_french, :string
  end
end
