class AddUsernameToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :username, :string
  end
end
