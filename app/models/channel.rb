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

# Model Channel keeps the data about the channels
#
class Channel < ApplicationRecord

  has_one_attached :logo
  slug :name

  validates :name, :logo, :language, :home_url, :timezone , presence: true
  validates :name, uniqueness: true

  scope :ordered, -> { order(:name) }

end
