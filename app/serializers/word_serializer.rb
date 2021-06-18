class WordSerializer < ActiveModel::Serializer
  attributes :id, :size, :title
  belongs_to :author
end
