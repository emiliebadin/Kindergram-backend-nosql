class MediasController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    data = params[:data].read
    post = PostMeta.create(:username => params[:username],
                           :media_id => Media.create(data).id,
                           :media_size => data.size)
    redirect_to :action => :index
  end

end
