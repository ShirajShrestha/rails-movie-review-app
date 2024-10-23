class MovieSerializer < ActiveModel::Serializer
  attributes :id, :original_title, :overview, :backdrop_path, :poster_path, :homepage,  :vote_average, :vote_count, :release_date,  :runtime, :status

  has_many :reviews
end
