class ArticlesController < ApplicationController

    before_action :authenticate_user!
    def index
        @articles = Article.all
        render json:@articles
      end
      
    def show
        @article = Article.find(params[:id])
    end

    before_action :authenticate_user!
    def new
        @article = Article.new
    end
   
    def create
        @article = Article.new(article_params)
   
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    before_action :authenticate_user!
    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end

    before_action :authenticate_user!
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
       
        redirect_to articles_path
    end
       
    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
      

end
