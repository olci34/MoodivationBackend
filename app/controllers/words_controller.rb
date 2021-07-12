class WordsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        lang = request.headers["language"]
        words = Word.all
        lang ? words.map { |word| word[:title] = word[:title][lang] || word[:title]["en"]} : words
        render json: words
    end

    def create
        lang = request.headers["language"]
        word = Word.new(word_params)
        if word.save
            word[:title] = word[:title][lang] || word[:title]["en"] if lang
            render json: word
        else
            errors = word.errors.full_messages
            render json: errors
        end
    end

    def update
        lang = request.headers["language"]
        word = Word.where("id = ?", params[:word][:id])[0]
        if word.update(word_params)
            render json: word
        else
            render json: word.errors.full_mmessages
        end
    end

    def destroy
        word = Word.find_by(id: params[:word_id])
        word.destroy
        render json: word
    end

    def word_params
        params.require(:word).permit(:size, :author_id, authors_attributes: [:name], category_ids: [], title: [:en, :tr])
    end
end
