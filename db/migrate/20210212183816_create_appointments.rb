class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: true
      t.string :time
      t.string :email

      t.timestamps
    end
  end
end
