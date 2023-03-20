class AddSpecialtyToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :specialty, :string
  end
end
