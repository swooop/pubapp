class CreatePubs < ActiveRecord::Migration
  def change
    create_table :pubs do |t|
      t.string :name
      t.references :location
      t.references :area

      t.timestamps
    end
    add_index :pubs, :location_id
    add_index :pubs, :area_id
  end
end
