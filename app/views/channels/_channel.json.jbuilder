json.extract! channel, :id, :name, :language, :home_url, :timezone, :created_at, :updated_at
json.logo_url rails_blob_url channel.logo
json.url channel_url(channel, format: 'json')
