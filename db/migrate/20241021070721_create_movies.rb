class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :tmdb_id
      t.string :imdb_id
      t.string :original_title
      t.text :overview
      t.string :backdrop_path
      t.string :poster_path
      t.string :homepage
      t.integer :budget
      t.date :release_date
      t.integer :runtime
      t.string :status
      t.float :vote_average
      t.integer :vote_count

      t.timestamps
    end
  end
end
