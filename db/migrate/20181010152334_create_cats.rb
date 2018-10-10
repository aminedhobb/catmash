class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :auid
      t.string :url
      t.integer :score

      t.timestamps
    end
  end
end
