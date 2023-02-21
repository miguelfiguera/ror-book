class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name
      t.string :city
      t.integer :age
      t.string :school
      t.string :favorite_dessert
      t.string :profile_picture_link

      t.timestamps
    end
  end
end
