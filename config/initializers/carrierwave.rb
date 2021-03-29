unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAUAXXMFHNTF4GXOWEQ',
      aws_secret_access_key: 'GJgrNQ67r9MkrDdvvPCHmC7ZyVSm/QUEUdTEF8mJ',
      region: 'ap-northeast-3'
    }

    config.fog_directory  = 'rails-photo-123'
    config.cache_storage = :fog
  end
end