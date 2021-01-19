class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating, :user_id, :movie_id
    end
  end
end
