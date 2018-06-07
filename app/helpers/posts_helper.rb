module PostsHelper

  def form_title
    @post.new_record? ? "Publish Post" : "Modify Post"
  end

end
