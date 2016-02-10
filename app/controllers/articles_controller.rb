## The controller is the engine of the application. It control everything from the click of a request to the execution of that request
## 
##

class ArticlesController < ApplicationController
	
	#display every article in the index page related to the articles (there may be more than one indexzes. The main one is defined in the routes.rb)
	def index
		@article = Article.all
	end

	def show
    	@article = Article.find(params[:id])
  	end

  	#The link between the engine (Create) and the action
	def new
		@article = Article.new # This makes the view file valid. It creates a new instance of Articles. So the new view file can access all methods of article
	end

	#The link between the engine (Update) and the action
	def edit
	  @article = Article.find(params[:id]) #the edit button must get the ID of which article he will update
	end


	# The engine of the creation of a new post. Engine of new.
	def create
	  @article = Article.new(article_params)
	 
	  if @article.save # The validation written in the model file is now a condition
	    redirect_to @article
	  else
	    render 'new' # render is a helper that directs the page to new, sending errors.
	  end
	
	end

	# Same thing as the creationg. It is the engine of the edit action.
	def update
	  @article = Article.find(params[:id])
	 
	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end

	 
	private # private because it will be accessible only in this class
	  def article_params
	    params.require(:article).permit(:title, :text)
	  end



end
