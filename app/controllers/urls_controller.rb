class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @url = Url.new( { :long => params[:url][:long], :short => params[:url][:short] || (('a'..'z').to_a + ('A'..'Z').to_a + (1..9).to_a).shuffle[0..2].join, :visits => 0 } )
    respond_to do |format|
      if @url.save
        format.html { redirect_to @url, notice: 'a url has been successfully created' }
      else
        flash.now[:notice] = "could not create the Url"
        format.html { render action: "new", notice: 'could not add the entry'}

      end
    end
  end

  def show
    @url = Url.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def edit
    @url = Url.find(params[:id])
  end

  def update
    @url = Url.find(params[:id])
    respond_to do |format|
      if @url.update_attributes( params[:url] )
        format.html { redirect_to @url, notice: 'Url was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy

    respond_to do |format|
      format.html { redirect_to urls_path }
    end
  end

  def visit
#   @url = Url.find_by_short(params[:short])
    @url = Url.where(:short => params[:short]).first
    @url.update_attributes(:visits => (@url.visits + 1))
    #logger.info @url.long
    redirect_to @url.long
  end


end
