class CreateBooks < ActiveRecord::Migration[4.2]
  def self.up
    create_table :books do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
