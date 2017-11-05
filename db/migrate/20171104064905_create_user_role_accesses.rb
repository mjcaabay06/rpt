class CreateUserRoleAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_role_accesses do |t|
      t.references :access, foreign_key: true
      t.references :user_role, foreign_key: true

      t.timestamps
    end
  end
end
