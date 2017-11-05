class CreateAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :accesses do |t|
      t.references :access_category, foreign_key: true
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
