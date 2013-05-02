class CreateBeersPubsBridgeTable < ActiveRecord::Migration

  def up
    create_table 'beers_pubs', :id => false do |t|
      t.references :beer
      t.references :pub
    end
  end

  def down
    drop_table 'beers_pubs'
  end
end
