class TasksController < ApplicationController
	before_action :all_tasks, only: [:index,:create,:destroy]
	before_action :set_tasks, only: [:edit,:update,:destroy]
	def index
		@tasks =Task.all

			
	end	
	def new
		@task=Task.new
	end
	def update
		@task.update_attributes(task_params)
	end	
	def destroy
		@task.destroy
	end	
	def create
	    @task =Task.create(task_params)	
	    @tasks=Task.all
	end
	def show 
		#raise params.inspect
		@task=Task.find(params[:id])
		respond_to do |format|
			format.html{render html:@task}
			format.json{render json:@task}
			format.xml{render xml: @task}
		
		end
		
	end	
private
    def set_tasks
    	@task =Task.find(params[:id])
    end	
    def all_tasks
    	@tasks=Task.all
    end
    def task_params
        params.require(:task).permit(:description,:deadline)	
    end    
end
