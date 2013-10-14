class AddNumberToPanels < ActiveRecord::Migration
  def change
    add_column :panels, :number, :integer
  end
end
