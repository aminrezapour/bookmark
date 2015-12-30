class LikesController < ApplicationController

  def create
     @link = Link.find(params[:link_id])
     like = current_user.likes.build(link: @link)

     authorize like

     if like.save
       flash[:notice] = "Like successful."
       redirect_to @link
     else
       flash[:error] = "There was an error liking the link"
       redirect_to @link
     end
   end

   def destroy
     @link = Link.find(params[:link_id])
     like = current_user.likes.build(link: @link)

     authorize like

     if like.destroy
       flash[:notice] = "Unlike successful."
       redirect_to @link
     else
       flash[:error] = "There was an error unliking the link"
       redirect_to @link
     end
   end

end
