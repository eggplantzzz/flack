class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.string :sender
      t.string :message
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
