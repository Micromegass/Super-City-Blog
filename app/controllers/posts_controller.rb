class PostsController < ApplicationController
before_action :private_access, except: [:index, :show]



    def index
     @posts = Post.all
    end
    
    def show
        @post = Post.find(params[:id])        
    end 

    def new
        @post = Post.new
    end 

    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:success] = "Fabuloso! Successfully created new post!"
            redirect_to posts_path
        else 
            flash[:alert] = "Sorry, an error occured. Please try again..."
            render :new
        end 
    end

    def edit
        @post = Post.find(params[:id])      
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)

        flash[:success] = "Successfully updated post..."
        redirect_to posts_path
        else 

        flash[:alert] = "Sorry, an error occured. Please try again..."
        render :edit
        end 
    end

    def destroy

        @post = Post.find(params[:id])
        if @post.destroy 
        flash[:success] = "Successfully deleted post"
        redirect_to root_path
        else 
        flash[:alert] = "Sorry, but an error occured. Please try again"
        redirect_to root_path
        end 
    end

    private
    def post_params
        params.require(:post).permit(:title, :description, :id, :image)
    end 

end
