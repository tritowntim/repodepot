class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :list_id
      t.integer :repository_id
      t.text :commentary
      t.integer :ordering

      t.timestamps
    end
  end
end
