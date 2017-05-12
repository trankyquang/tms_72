class CreateUsers < ActiveRecord::Migration[5.0]

  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar_url
      t.string :password_digest
      t.string :remember_digest
      t.integer :role
      t.timestamps
    end
  end
end
