class AddNumberToItems < ActiveRecord::Migration
  def change
    add_column :items, :number, :integer
  end
end
