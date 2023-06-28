class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :second_name
      t.string :famaly_name
      t.string :phone, null: false, index: {unique: true}
      t.string :password_digest

      t.timestamps
    end
  end
end
