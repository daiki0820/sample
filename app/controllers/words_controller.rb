class WordsController < ApplicationController
    def index
        @words = Word.all.page(params[:page]).per(9)
    end

    def new
        @word = Word.new
    end

    def create
        word = Word.new(word_params)
        word.user_id = current_user.id
        if word.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end
    
    def show
        @word = Word.find(params[:id])
        @meanings = @word.meanings.order(created_at: :desc).all.page(params[:page]).per(9)
        @meaning = Meaning.new
        #いいねランキング 
        @rank_meanings = @word.meanings.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
    end

    def show2
        @word = Word.find(params[:id])
        @meanings = @word.meanings.order(created_at: :desc).all.page(params[:page]).per(9)
        @meaning = Meaning.new
        #いいねランキング 
        @rank_meanings = @word.meanings.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        @rank_meanings = Kaminari.paginate_array(@rank_meanings).page(params[:page]).per(9)
    end

    def edit
        @word = Word.find(params[:id])
    end

    def update
        word = Word.find(params[:id])
        if word.update(word_params)
          redirect_to :action => "show", :id => word.id
        else
          redirect_to :action => "edit"
        end
    end

    def destroy
        word = Word.find(params[:id])
        word.destroy
        redirect_to action: :index
    end

    private
    def word_params
        params.require(:word).permit(:word, :meaning, :furigana, :user_id)
    end
end
