class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :user_id
      t.integer :percentage

      t.timestamps
    end
  end
end
