class AddTitleFrenchToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title_french, :text
  end
end
