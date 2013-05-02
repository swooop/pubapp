class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.date :visited_on
      t.references :user
      t.references :pub

      t.timestamps
    end
    add_index :visits, :user_id
    add_index :visits, :pub_id
  end
end
