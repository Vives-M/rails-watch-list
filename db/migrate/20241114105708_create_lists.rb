class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.string :name, presence: true, uniqueness:true

      t.timestamps
    end
  end
end
