require 'rails_helper'

describe "channels/index", type: :view do
  let!(:channel) {create :channel}

  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    allow(controller).to receive(:params)
        .and_return(ActionController::Parameters.new({}))
    assign :channels, Channel.all
  end

  it "renders a list of channels" do
    render

    assert_select 'tr>td.logo>img[alt=?]', channel.name
    assert_select 'tr>td.name', text: channel.name.to_s, count: 1
    assert_select 'tr>td.language', text: channel.language.to_s, count: 1
    assert_select 'tr>td.home_url>a', text: channel.home_url.to_s, count: 1
    assert_select 'tr>td', text: Regexp.new(Regexp.escape channel.timezone.to_s)
  end

  it "renders a list of channels in WiceGrid" do
    assign :grid, Wice::WiceGrid.new(Channel, controller)
    render

    assert_select 'tr>td.logo>img[alt=?]', channel.name
    assert_select 'tr>td.name', text: channel.name.to_s, count: 1
    assert_select 'tr>td.language', text: channel.language.to_s, count: 1
    assert_select 'tr>td.home_url>a', text: channel.home_url.to_s, count: 1
    assert_select 'tr>td', text: Regexp.new(Regexp.escape channel.timezone.to_s)
  end
end
