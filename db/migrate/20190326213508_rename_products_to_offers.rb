class RenameProductsToOffers < ActiveRecord::Migration[5.2]
def self.up
    rename_table :products, :offers
  end

  def self.down
    rename_table :offers, :products
  end
end
