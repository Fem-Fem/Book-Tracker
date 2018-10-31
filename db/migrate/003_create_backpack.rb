class CreateBackpack < ActiveRecord::Migration[4.2]
  def up
    create_table :backpacks do |t|
      t.string :name
    end
  end

  def down
    drop_table :backpacks
  end
end
