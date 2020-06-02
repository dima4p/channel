require 'rails_helper'

describe "channels/edit", type: :view do
  let(:channel) {create :channel}

  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    assign(:channel, channel)
  end

  it "renders the edit channel form" do
    render

    assert_select "form[action='#{channel_path(channel)}'][method='post']" do
      assert_select 'input#channel_name[name=?]', 'channel[name]'
      assert_select 'select#channel_language[name=?]', 'channel[language]'
      assert_select 'input#channel_home_url[name=?]', 'channel[home_url]'
      assert_select 'input#channel_logo[name=?]', 'channel[logo]'
      assert_select 'select#channel_timezone[name=?]', 'channel[timezone]'
    end
  end
end
