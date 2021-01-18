class CommentsController < ApplicationController
	
	before_action :set_announcement
	before_action :authenticate_user!, only:[:create, :destroy]
	
	def create
		@comment = @announcement.comments.new(comment_params)
		@comment.user = current_user
		@comment.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@comment = @announcement.comments.find(params[:id])
		@comment_id = @comment.id
		@comment.destroy
	end

	private
	def comment_params
		params.require(:comment).permit(:body, :announcement_id)
	end
	def set_announcement
		@announcement = Announcement.find(params[:announcement_id])
	end
end
