class WordsController < ApplicationController
    def index
        words = Word.all
        render json: words
    end

    def create
        word = Word.new(word_params)
        if word.save
            render json: word
        else
            errors = word.errors.full_mmessages
            render json: errors
        end
    end

    def word_params
        require.params(:word).permit(:size, :title, :author_id)
    end
end
