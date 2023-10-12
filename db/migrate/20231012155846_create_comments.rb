class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author, null: false, foreign_key: {to_table: :users}, index: false ## We use to_table: :users since author isn't the name of a table. We need to connect it to users table
      t.references :photo, null: false, foreign_key: true ##Unlike :author, :photo is a table so we just set foreign_key: tue
      t.text :body, null: false

      t.timestamps
    end
  end
end
