class AddRelatedModulesToItems < ActiveRecord::Migration
  def change
    add_column :items, :related_modules, :string
  end
end
