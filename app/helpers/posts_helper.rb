module PostsHelper
  def user_is_authorized_for_post?(post)
    current_user && (current_user == post.user || current_user.admin?)
  end

  def no_post_present?(current_user)
  	 user.post.empty?
  	 
  end	 	
end
