class AddBreweryToBeer < ActiveRecord::Migration
  def change
    add_column :beers, :brewery_id, :integer
  end
end
