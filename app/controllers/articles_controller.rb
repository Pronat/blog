class ArticlesController < ApplicationController

	def index
		@articles = Article.all	
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
	end

	def create
		@article = Article.new(article_params)
		if@article.valid?
			@article.save  #если валидация true, то возвращаем app/views/article/create.html.erb
			redirect_to @article
		else
			render action: 'new'	#запускаем метод def new (action)
		end
	end

	private
	def article_params
		params.require(:article).permit(:title, :text)
	end
end
