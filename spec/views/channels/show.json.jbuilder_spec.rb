require 'rails_helper'

describe "channels/show.json.jbuilder", type: :view do
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    @channel = assign(:channel, create(:channel))
    render
  end

  attributes = %w[
    id
    name
    language
    logo_url
    home_url
    timezone
    created_at
    updated_at
    url
  ]

  it "renders the following attributes of channel: #{attributes.join(', ')} as json" do
    hash = MultiJson.load rendered
    expect(hash.keys.sort).to eq attributes.sort
    expected = @channel.attributes.slice *attributes
    expected = MultiJson.load MultiJson.dump expected
    expected['url'] = channel_url(@channel, format: 'json')
    expected['logo_url'] = rails_blob_url @channel.logo
    expect(hash).to eq expected
  end
end
