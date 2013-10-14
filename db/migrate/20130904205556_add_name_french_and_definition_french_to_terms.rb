class AddNameFrenchAndDefinitionFrenchToTerms < ActiveRecord::Migration
  def change
    add_column :terms, :name_french, :string
    add_column :terms, :definition_french, :text
  end
end
