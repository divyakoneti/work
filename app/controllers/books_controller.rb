class BooksController < ApplicationController
	before_action :authenticate_user!,only: [:index]  #anthenticate the user here before sign in
	
	def new
		@catagories =Catagory.all   #get the all records of catagories
		@book=Book.new
	end
	def index
	    @books=Book.paginate(:per_page =>3,:page=>params[:page])#
	    @user=User.all
	    
	    

	    #render xml: @books

	end 
	def create
		#raise params.inspect
	    @catagories=Catagory.all    ##get the all records of catagories
	    #raise params.inspect
	    @book=Book.new(book_params)
        @user=User.create(email: params[:email])
	    @books=Book.all
	    if @book.save
	       redirect_to books_path
	    else
	       render 'new'
	    end 
	end
	def edit 
		@catagories=Catagory.all  #get the all records of catagories
		@book=Book.find(params[:id])
	end
	def update
		@catagory=Catagory.all   #get the all records of catagories
		@book=Book.find(params[:id])
		if  @book.update(book_params)
			redirect_to books_path
		else
		    render 'edit'	
		end
	end
	def destroy
	    @book=Book.find(params[:id])
	    if @book.destroy
	      redirect_to books_path
	    end
	end 
	def show
		#raise current_user.inspect
       @book =Book.find(params[:id]) #get the book id
       if @book.user_id==nil         #if the user_id nill
	   	 @book.update(user_id: current_user.id)
	   	 @user= current_user
	   else
	     flash[:danger]="book is not avialable"	 
	     redirect_to books_path
	   end
	end   
    def return
    	#raise params.inspect
    	@book=Book.find(params[:id])
    	@book.update(user_id: nil)
    	redirect_to books_path
    end	      		



private
    def book_params
      params.require(:book).permit(:book_title,:catagory_id)  #strong parameters
    end   	          	
end
