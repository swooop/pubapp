class CreateBreweriesPubsBridgeTable < ActiveRecord::Migration
  def up
    create_table 'breweries_pubs', :id => false do |t|
      t.references :brewery
      t.references :pub
    end
  end

  def down
    drop_table 'breweries_pubs'
  end
end
