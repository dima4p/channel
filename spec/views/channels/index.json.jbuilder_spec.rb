require 'rails_helper'

describe "channels/index.json.jbuilder", type: :view do
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    @channel = create(:channel)
    assign :channels, [@channel, @channel]
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

  it "renders a list of channels as json with following attributes: #{attributes.join(', ')}" do
    hash = MultiJson.load rendered
    expect(hash.first).to eq(hash = hash.last)
    expect(hash.keys.sort).to eq attributes.sort
    expected = @channel.attributes.slice *attributes
    expected = MultiJson.load MultiJson.dump expected
    expected['url'] = channel_url(@channel, format: 'json')
    expected['logo_url'] = rails_blob_url @channel.logo
    expect(hash).to eq expected
  end
end
