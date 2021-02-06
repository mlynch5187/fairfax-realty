class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
