class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :receiver_id
      t.text :body
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
