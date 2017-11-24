class RemoveColumnFromDoses < ActiveRecord::Migration[5.0]
  def change
    remove_column :doses, :cocktail_id, :integer
    remove_column :doses, :ingredient_id, :integer
  end
end
