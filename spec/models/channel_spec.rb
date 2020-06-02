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
require 'rails_helper'

describe Channel, type: :model do

  subject(:channel) { create :channel }

  describe 'validations' do
    it { is_expected.to be_valid }
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_uniqueness_of :name}
    it {is_expected.to validate_presence_of :language}
    it {is_expected.to validate_presence_of :home_url}
    it {is_expected.to validate_presence_of :timezone}
  end   # validations

  describe 'class methods' do
    describe 'scopes' do
      describe '.ordered' do
        it 'orders the records of Channel by :name' do
          create :channel
          create :channel
          expect(Channel.ordered).to eq Channel.order(:name)
        end
      end   # .ordered
    end   # scopes
  end   # class methods

  describe "#logo" do
    it "has_one_attached" do
      is_expected.to respond_to :logo
    end
  end

end
