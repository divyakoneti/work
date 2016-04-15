class CatagoriesController < ApplicationController
    before_action :authenticate_user!,only: [:index,:new,:create]
    
	def index
		@catagories  =Catagory.paginate(:per_page =>5,:page=>params[:page])#get the all records of catagories
		@catagories=Catagory.all
	end
	def show
	   @catagory =Catagory.find(params[:id])  
	   @books=@catagory.books  #here display one catagory has how many books
	   @book=Book.new
	   @catagories=Catagory.all  #total catagories
       
	end
	def new
	  @catagory=Catagory.new   
	end 
	def create
	   @catagory=Catagory.new(catagory_params) #create the new catagory
	    if @catagory.save
	       redirect_to catagories_path
	    else
	        render 'new'
	    end
	end
	def edit
		@catagory=Catagory.find(params[:id])
	end
	def update
	    @catagory=Catagory.find(params[:id])  #edit form
	     if@catagory.update(catagory_params)
	       redirect_to catagories_path
	     else
	       render 'edit'
	     end
	end         	
	def destroy
		@catagory=Catagory.find(params[:id]) #delete form
		if @catagory.destroy
			redirect_to catagories_path
		end
	end		
private
    def catagory_params
       params.require(:catagory).permit(:name,:no_of_copies) #strong params
    end   	        	
	             	
end

