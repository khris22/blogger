class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.text  :notes
      t.integer :user_id
      t.timestamps
    end
  end
end
