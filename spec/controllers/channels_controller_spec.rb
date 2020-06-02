require 'rails_helper'

describe ChannelsController, type: :controller do
  before :each do
    allow(controller).to receive(:current_user).and_return(current_user)
  end

  # This should return the minimal set of attributes required to create a valid
  # Channel. As you add validations to Channel, be sure to
  # adjust the attributes here as well. The list could not be empty.
  let(:channel) {create :channel}

  let(:valid_attributes) do
    attributes_for(:channel).slice *%i[
      home_url
      language
      logo
      name
      timezone
    ]
  end

  let(:invalid_attributes) do
    {name: ''}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ChannelsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all channels as @channels" do
      channel
      get :index, params: {}, session: valid_session
      expect(assigns(:channels)).to be_kind_of(ActiveRecord::Relation)
      expect(assigns(:channels)).to eq([channel])
    end
  end

  describe "GET #show" do
    it "assigns the requested channel as @channel" do
      get :show,
          params: {id: channel.to_param},
          session: valid_session
      expect(assigns(:channel)).to eq(channel)
    end
  end

  describe "GET #new" do
    it "assigns a new channel as @channel" do
      get :new, params: {}, session: valid_session
      expect(assigns(:channel)).to be_a_new(Channel)
    end
  end

  describe "GET #edit" do
    it "assigns the requested channel as @channel" do
      get :edit, params: {id: channel.to_param},
          session: valid_session
      expect(assigns(:channel)).to eq(channel)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Channel" do
        expect do
          post :create,
              params: {channel: valid_attributes},
              session: valid_session
        end.to change(Channel, :count).by(1)
      end

      it "assigns a newly created channel as @channel" do
        post :create,
            params: {channel: valid_attributes},
            session: valid_session
        expect(assigns(:channel)).to be_a(Channel)
        expect(assigns(:channel)).to be_persisted
      end

      it "redirects to the created channel" do
        post :create,
            params: {channel: valid_attributes},
            session: valid_session
        expect(response).to redirect_to(Channel.last)
        # expect(response).to redirect_to(channels_url)
      end
    end   # with valid params

    context "with invalid params" do
      it "assigns a newly created but unsaved channel as @channel" do
        # allow_any_instance_of(Channel).to receive(:save).and_return(false)
        post :create,
            params: {channel: invalid_attributes},
            session: valid_session
        expect(assigns(:channel)).to be_a_new(Channel)
      end

      it "re-renders the 'new' template" do
        # allow_any_instance_of(Channel).to receive(:save).and_return(false)
        post :create,
            params: {channel: invalid_attributes},
            session: valid_session
        expect(response).to render_template("new")
      end
    end   # with invalid params
  end   # POST #create

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {name: 'New value'} }

      it "updates the requested channel" do
        # expect_any_instance_of(Channel)
        #   .to receive(:update).with(new_attributes.inject({}){|_, (k, v)| _[k] = v.to_s; _})
        put :update,
            params: {id: channel.to_param,
                     channel: new_attributes},
            session: valid_session
        channel.reload
        # skip("Add assertions for updated state")
        expect(channel.name).to eq 'New value'
      end

      it "assigns the requested channel as @channel" do
        put :update,
            params: {id: channel.to_param,
                     channel: valid_attributes},
            session: valid_session
        expect(assigns(:channel)).to eq(channel)
      end

      it "redirects to the channel" do
        put :update,
            params: {id: channel.to_param,
                     channel: valid_attributes},
            session: valid_session
        expect(response).to redirect_to(channel)
      end
    end  # with valid params

    context "with invalid params" do
      it "assigns the channel as @channel" do
        # allow_any_instance_of(Channel).to receive(:update).and_return(false)
        put :update,
            params: {id: channel.to_param,
                     channel: invalid_attributes},
            session: valid_session
        expect(assigns(:channel)).to eq(channel)
      end

      it "re-renders the 'edit' template" do
        # allow_any_instance_of(Channel).to receive(:update).and_return(false)
        put :update,
            params: {id: channel.to_param,
                     channel: invalid_attributes},
            session: valid_session
        expect(response).to render_template("edit")
      end
    end   # with invalid params
  end   # PUT #update

  describe "DELETE #destroy" do
    it "destroys the requested channel" do
      channel
      expect do
        delete :destroy,
            params: {id: channel.to_param},
            session: valid_session
      end.to change(Channel, :count).by(-1)
    end

    it "redirects to the channels list" do
      channel
      delete :destroy,
          params: {id: channel.to_param},
          session: valid_session
      expect(response).to redirect_to(channels_url)
    end
  end   # DELETE #destroy

end
