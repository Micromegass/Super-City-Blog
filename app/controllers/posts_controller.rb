class PostsController < ApplicationController
before_action :private_access, except: [:index, :show]
   
    def index
      @posts = if params[:term]
      Post.where("title LIKE ? OR description LIKE ?" , "%#{params[:term]}%", "%#{params[:term]}%")
      else
      @posts = Post.all.order("updated_at DESC")
      end 
    end

    def show
     @post = Post.find(params[:id])        
    end 

    def new
     @post = Post.new
    end 

    def create
      @post = Post.new(post_params)
      @post.user = current_user
     if @post.save
      flash[:success] = "Fabuloso! Has creado un nuevo post....!"
      redirect_to posts_path
     else 
      render :new
     end 
    end

    def edit
       @post = Post.find(params[:id])      
    end

    def update
       @post = Post.find(params[:id])
         if @post.update(post_params)
          flash[:success] = "Bravo! Post fue editado..."
          redirect_to posts_path
         else 
          render :edit
         end 
    end

 
     def destroy
        post = Post.find(params[:id])
        if post.destroy
        flash[:danger] = "El post fue eliminado con éxito"
        redirect_to posts_path
        else  
        flash[:danger] = "Habia un error. Por favor intenta otra vez..."
        end
     end 
  
     private
     def post_params
        params.require(:post).permit(:title, :description, :id, :image, :term)
     end 
    
end
