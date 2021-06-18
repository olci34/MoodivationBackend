class Category < ApplicationRecord
    has_many :words_categories
    has_many :words, through: :words_categories
end
