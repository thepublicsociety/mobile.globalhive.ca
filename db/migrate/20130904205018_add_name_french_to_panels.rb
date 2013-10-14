class AddNameFrenchToPanels < ActiveRecord::Migration
  def change
    add_column :panels, :name_french, :string
  end
end
