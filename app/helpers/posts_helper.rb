module PostsHelper

  def form_title
    @post.new_record? ? "Publish Post" : "Modify Post"
  end

  def header_style 
     if @post.image.exists?
    %{ style="background-image: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('#{@post.image.url}'); height:100%; background-position:center; background-repeat:no-repeat; background-size:cover" }.html_safe
      
   else
    ""
  end 
  end 
  end 