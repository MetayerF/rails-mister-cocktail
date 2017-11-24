class AddReferencesToDoses < ActiveRecord::Migration[5.0]
  def change
    add_column :doses, :cocktail_id, :integer
    add_column :doses, :ingredient_id, :integer
  end
end
