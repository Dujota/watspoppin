class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    @story = Story.new
    @story.content = params[:story][:content]
    @story.image = params[:story][:image]
    @story.latitude = params[:story][:latitude]
    @story.longitude = params[:story][:longitude]
    @story.user_id = current_user.id
    @story.source = "internal"

    if @story.save
      flash.notice = 'Story created'
      redirect_to root_path
    else
      flash.alert = 'Story could not be created. Please correct and try again.'
      render 'new'
    end
  end

end
