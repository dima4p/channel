# == Schema Information
#
# Table name: channels
#
#  id         :bigint           not null, primary key
#  name       :string
#  home_url   :string
#  language   :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  timezone   :string
#
# Indexes
#
#  index_channels_on_slug  (slug) UNIQUE
#
FactoryBot.define do
  factory :channel do
    sequence(:name) {|n| "ChannelName#{format '%03d', n}" }
    sequence(:language) {|n| "Language#{format '%03d', n}" }
    sequence(:home_url) {|n| "http://home#{format '%03d', n}.com" }
    timezone {ActiveSupport::TimeZone.all.sample.name}
    after :build do |channel|
      channel.logo.attach io: File.open(Rails.root.join *%w[spec fixtures files arte.png]),
          filename: 'arte.png',
          content_type: 'image/png'
    end
  end
end
