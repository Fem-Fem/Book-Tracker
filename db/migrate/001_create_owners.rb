class CreateOwners < ActiveRecord::Migration[4.2]
  def up
    create_table :owners do |t|
      t.string :username
      t.string :password_digest
      t.string :name
    end
  end

  def down
    drop_table :owners
  end
end
