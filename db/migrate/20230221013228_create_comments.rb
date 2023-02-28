class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :commentable, null:false, polymorphic: true
      t.references :user, null: false, foreign_key: :user_id
      t.text :body

      t.timestamps
    end
  end
end
