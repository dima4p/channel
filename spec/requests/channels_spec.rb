require 'rails_helper'

describe "Channels", type: :request do
  before :each do
    allow_any_instance_of(ChannelsController).to receive(:current_user).and_return(current_user)
  end

  describe "GET /channels" do
    it "works! (now write some real specs)" do
      get channels_path
      # expect(response).to have_http_status(200)
    end
  end
end
