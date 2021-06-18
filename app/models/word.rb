class Word < ApplicationRecord
    belongs_to :author
    has_many :words_categories
    has_many :categories, through: :words_categories
end
