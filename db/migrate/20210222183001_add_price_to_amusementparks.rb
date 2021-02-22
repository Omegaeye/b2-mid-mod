class AddPriceToAmusementparks < ActiveRecord::Migration[5.2]
  def change
    add_column :amusement_parks, :price, :float
  end
end
