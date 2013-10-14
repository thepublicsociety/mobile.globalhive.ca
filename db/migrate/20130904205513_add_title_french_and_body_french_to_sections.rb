class AddTitleFrenchAndBodyFrenchToSections < ActiveRecord::Migration
  def change
    add_column :sections, :title_french, :string
    add_column :sections, :body_french, :text
  end
end
