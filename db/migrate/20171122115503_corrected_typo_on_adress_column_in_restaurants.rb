class CorrectedTypoOnAdressColumnInRestaurants < ActiveRecord::Migration[5.1]
  def change
    # rename_column :table, :old_column, :new_column
    rename_column :restaurants, :adress, :address
  end
end
