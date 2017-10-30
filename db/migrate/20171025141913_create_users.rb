class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email_address
      t.string :username
      t.string :password
      t.references :user_role, foreign_key: true

      t.timestamps
    end
  end
end
