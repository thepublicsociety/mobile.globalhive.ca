class AddPanelIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :panel_id, :integer
  end
end
