require 'rails_helper'

RSpec.describe Story, type: :model do
  describe '#save_tweet' do
    it 'saves tweet to database' do
      # https://www.ombulabs.com/blog/rspec/ruby/spy-vs-double-vs-instance-double.html
      tweet = instance_double(Twitter::Tweet, {
        retweeted_status?: false,
        geo?: true,
        id: '101',
        text: "Soy un tweet",
        # OpenStruct
        user: OpenStruct.new({
          screen_name: 'tenderlove'
        }),
        geo: OpenStruct.new({
          latitude: 43.6532,
          longitude: -79.3832
        }),
        media: [OpenStruct.new({
          media_uri_https: 'https://www.runnersworld.com/sites/runnersworld.com/files/styles/listicle_slide_custom_user_phone_1x/public/beagle2.jpg?itok=lv5EvG-2'
        })],
        hashtags: [OpenStruct.new({
          text: 'dogdogdog'
        })]
      })

      story = Story.save_tweet(tweet)

      expect(story).to be_a(Story)
      expect(tweet.hashtags.count).to eq(1)
      expect(Story.count).to eq(1)
    end
  end
end
