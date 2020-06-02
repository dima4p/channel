require 'rails_helper'

describe "channels/show", type: :view do
  let(:channel) {create :channel}

  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    assign :channel, channel
  end

  it "renders attributes in dl>dd" do
    render
    assert_select 'dl>dd.logo>img[alt=?]', channel.name
    assert_select 'dl>dd.name', text: Regexp.new(channel.name.to_s)
    assert_select 'dl>dd.language', text: Regexp.new(channel.language.to_s)
    assert_select 'dl>dd.home_url>a', text: Regexp.new(channel.home_url.to_s)
    assert_select 'dl>dd', text: Regexp.new(Regexp.escape channel.timezone.to_s)
  end
end
