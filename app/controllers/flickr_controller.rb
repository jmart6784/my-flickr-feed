class FlickrController < ApplicationController

  def index
    FlickRaw.api_key = ENV['flickr_api_key']
    FlickRaw.shared_secret = ENV['flickr_secret']
    @flickr = FlickRaw::Flickr.new

    if params[:search]
      unless params[:search][:user].blank?
        @photos = flickr.photos.search(user_id: params[:search][:user])
      end
    end
  end

  private

  def search_params
    params.require(:search).permit(:user)
  end
end
