class MeaningsController < ApplicationController
    before_action :authenticate_user!

    def create
        word = Word.find(params[:word_id])
        meaning = word.meanings.build(meaning_params)
        meaning.user_id = current_user.id
        if meaning.save
            flash[:success] = "コメントしました"
            redirect_back(fallback_location: root_path)
        else
            flash[:success] = "コメントできませんでした"
            redirect_back(fallback_location: root_path)
        end
    end

    def edit
        @word = Word.find(params[:word_id])
        @meaning = Meaning.find(params[:id])
    end

    def update
        meaning = Meaning.find(params[:id])
        if meaning.update(meaning_params)
            redirect_to :controller => "words", :action => "show", :id => meaning.word_id
        else
            redirect_to :action => "edit"
        end
    end

    def destroy
        meaning = Meaning.find(params[:id])
        meaning.destroy
        redirect_back(fallback_location: root_path)
    end

    private
    def meaning_params
      params.require(:meaning).permit(:meaning)
    end
end
