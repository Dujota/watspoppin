class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    @story = Story.new
    @story.content = params[:story][:content]
    @story.image = params[:story][:image]
    # @story.source =
    # @story.latitude =
    # @story.longitude =

    if @story.save
      flash.notice = 'Story created'
      redirect_to root_path
    else
      flash.alert = 'Story could not be created. Please correct and try again.'
      render 'new'
    end
  end

  def search
    twitter_searcher = TwitterSearcher.new(params[:hashtag], params[:latitude], params[:longitude])
    twitter_searcher.search

    @hashtag = Hashtag.find_by(name: params[:hashtag].downcase)

    if @hashtag
      @stories = @hashtag.stories.near([params[:latitude], params[:longitude]]).last(100)
    else
      @stories = Story.near([params[:latitude], params[:longitude]]).last(100)
    end


    render json: @stories
  end

end
