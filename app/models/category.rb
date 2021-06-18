class Category < ApplicationRecord
    has_many :words_categories
    has_many :words, through: :words_categories
    validates :name, presence: true, uniqueness: true
end
