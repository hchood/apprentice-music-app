class SongSerializer < ActiveModel::Serializer
  attributes :name, :duration, :album_title
end
