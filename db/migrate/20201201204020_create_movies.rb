class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :rate_age, :quantity
    end
  end
end
