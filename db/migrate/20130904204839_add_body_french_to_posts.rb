class AddBodyFrenchToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :body_french, :text
  end
end
