class Word < ApplicationRecord
    belongs_to :author
    has_many :words_categories
    has_many :categories, through: :words_categories
    validates :title, presence: true

    def authors_attributes=(attributes)
        author = Author.find_or_create_by(name: attributes[:name])
        author.words << self
    end
end
