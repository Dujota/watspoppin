CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
      aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
      region:                'us-east-1'
    }
    config.fog_directory  = 'watspoppinapp'
    config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" }
  end
end
