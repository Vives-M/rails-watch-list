class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title, presence: true, uniqueness:true
      t.text :overview, presence: true
      t.text :poster_url
      t.integer :rating, inclusion: 0..10

      t.timestamps
    end
  end
end
