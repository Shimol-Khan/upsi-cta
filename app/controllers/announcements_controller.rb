class AnnouncementsController < ApplicationController

  impressionist :actions=>[:show]
  load_and_authorize_resource
  
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [ :edit, :update, :destroy]

  def index
    @announcements = Announcement.all.order('created_at DESC')
  end

  def show
    @comment = Comment.new
    @comments = @announcement.comments.order('created_at DESC')

    impressionist @announcement
  end

  def new
    @announcement = current_user.announcements.build
  end

  def edit
  end

  def create
    @announcement = current_user.announcements.build(announcement_params)

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to @announcement, notice: 'Announcement was successfully posted' }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to @announcement, notice: 'Announcement was successfully updated' }
        format.json { render :show, status: :ok, location: @announcement }
      else
        format.html { render :edit }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @announcement.destroy
    respond_to do |format|
      format.html { redirect_to announcements_url, notice: 'Announcement was successfully removed' }
      format.json { head :no_content }
    end
  end

  private
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    def announcement_params
      params.require(:announcement).permit(:title, :image_link, :body, :user_id)
    end
end
