class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    Story.create(params[:story])
    # @story = Story.new
    # @story.content = params[:story][:content]
    # @story.image = params[:story][:image]
    # @story.latitude = params[:story][:latitude]
    # @story.longitude = params[:story][:longitude]
    # @story.user_id = current_user.id
    @story.source = "watspoppin"

    if @story.save
      flash.notice = 'Story created'
      redirect_to root_path
    else
      flash.alert = 'Story could not be created. Please correct and try again.'
      render 'new'
    end

  end

  def search
    begin
      twitter_searcher = TwitterSearcher.new(params[:hashtag], params[:latitude], params[:longitude])
      twitter_searcher.search
    rescue Twitter::Error::TooManyRequests
      puts 'Twitter too many requests'
    end

    # begin
    #   instagram_searcher = InstagramSearcher.new(params[:hashtag], params[:latitude], params[:longitude])
    #   instagram_searcher.search
    # rescue Instagram::BadRequest
    # end

    @hashtag = Hashtag.find_by(name: params[:hashtag].downcase.delete('#'))

    if @hashtag
      @stories = @hashtag.stories.near([params[:latitude], params[:longitude]]).last(100)
    else
      @stories = Story.near([params[:latitude], params[:longitude]]).last(100)
    end

    render json: @stories
  end

# Twitter Post Methods
  def twitter
    client = Twitter::REST::Client.new(twitter_config)
  end

  def twitter_config
    config = {
    consumer_key:    "YOUR_CONSUMER_KEY",
    consumer_secret: "YOUR_CONSUMER_SECRET",
    }
  end

  def post_to_twitter
    #code
  end

  private

  def story_params
    params.require(:story).permit(:content, :image, :latitude, :longitude, :user_id)
  end

end
