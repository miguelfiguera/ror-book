class AddingNamesToMessages < ActiveRecord::Migration[7.0]
  def up
    add_column :messages, :sender_name, :string
    add_column :messages, :receiver_name, :string
  end

  def down
    remove_column :messages, :sender_name, :string
    remove_column :messages, :receiver_name, :string
  end
end
