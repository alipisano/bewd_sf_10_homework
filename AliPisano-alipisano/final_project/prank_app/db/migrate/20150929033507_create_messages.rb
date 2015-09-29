#create a messages table with one string column and a text column 

class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :recipient
      t.text :image

      t.timestamps null: false
    end
  end
end
