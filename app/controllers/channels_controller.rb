# This is the main controller to process model Channel
#
class ChannelsController < ApplicationController

  load_and_authorize_resource find_by: :slug

  # GET /channels
  def index
    respond_to do |format|
      format.html do
        @grid = initialize_grid @channels, order: :name
      end
      format.json do
        @channels = @channels.page(params[:page]) if params[:page].present?
        @channels = @channels.per(params[:per_page]) if params[:per_page].present?
      end
    end
  end

  # GET /channels/1
  def show
  end

  # GET /channels/new
  def new
  end

  # GET /channels/1/edit
  def edit
  end

  # POST /channels
  def create
    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: t('channels.was_created') }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channels/1
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to @channel, notice: t('channels.was_updated') }
        format.json { render :show, status: :ok, location: @channel }
      else
        format.html { render :edit }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: t('channels.was_deleted') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_channel
  #   @channel = Channel.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def channel_params
    list = %i[
      home_url
      language
      logo
      name
      timezone
    ]
    params.require(:channel).permit(*list)
  end
end
